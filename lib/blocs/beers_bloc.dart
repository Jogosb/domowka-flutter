import 'dart:async';
import 'package:domowka/blocs/bloc.dart';
import 'package:domowka/data/remote/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domowka/models/api/beers_response.dart';

abstract class BeersBloc extends Bloc {
  Stream<List<Beer>> get beers;
}
class BeersBlocImpl extends BeersBloc {
  final ApiClient apiClient;
  final BehaviorSubject<List<Beer>> _beersList;

  BeersBlocImpl(this.apiClient)
      : assert(apiClient != null),
        _beersList = new BehaviorSubject(seedValue: []) {
    apiClient.fetchBeers().then((value) {
      print("beers fetched! ${value.length}");
      _beersList.add(value);
    });
  }

  @override
  Stream<List<Beer>> get beers => _beersList;

  @override
  void dispose() {
    _beersList.close();
  }
}
