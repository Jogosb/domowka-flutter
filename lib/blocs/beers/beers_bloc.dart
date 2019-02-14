import 'package:domowka/blocs/beers/beers_bloc_state.dart';
import 'package:domowka/blocs/bloc.dart';
import 'package:domowka/data/remote/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domowka/models/api/beers_response.dart';

abstract class BeersBloc extends Bloc<BeersBlocState> {
  ValueObservable<BeersBlocState> get beers;
}

class BeersBlocImpl extends BeersBloc {
  final ApiClient apiClient;
  BehaviorSubject<BeersBlocState> _beersState;

  BeersBlocImpl(this.apiClient) : assert(apiClient != null) {
    _beersState = new BehaviorSubject(seedValue: initialState);
    {
      apiClient.fetchBeers()
      .then((value) {
        print("beers fetched! ${value.length}");
        _beersState.add(BeersLoadedState(value));
      }).catchError((error) {
        print("error $error");
        _beersState.add(BeersLoadingErrorState(error: error));
      });
    }
  }

  @override
  BeersBlocState get initialState => BeersLoadingState();

  @override
  ValueObservable<BeersBlocState> get beers => _beersState;

  @override
  void dispose() {
    _beersState.close();
  }

  handleErrror(eroror) {}
}
