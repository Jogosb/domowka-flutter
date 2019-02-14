import 'package:domowka/blocs/beers/beers_bloc.dart';
import 'package:domowka/blocs/beers/beers_bloc_state.dart';
import 'package:domowka/models/api/beers_response.dart';
import 'package:flutter/material.dart';

class BeersList extends StatelessWidget {
  final BeersBloc bloc;

  const BeersList({Key key, @required this.bloc})
      : assert(bloc != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BeersBlocState>(
      stream: bloc.beers,
      builder: _buildView,
    );
  }

  Widget _buildView(
      BuildContext context, AsyncSnapshot<BeersBlocState> snapshot) {
    if (snapshot.data is BeersLoadedState) {
      return _buildBeersView(
          context, (snapshot.data as BeersLoadedState).beers);
    } else if (snapshot.data is BeersLoadingErrorState) {
      return _buildErrorView(context);
    } else if (snapshot.data is BeersLoadingState) {
      return _buildProgressView(context);
    } else {
      return _buildNoItemsView(context);
    }
  }

  Widget _buildProgressView(BuildContext context) {
    return Text("PROGRESS");
  }

  Widget _buildErrorView(BuildContext context) {
    return Text("ERROR");
  }

  Widget _buildNoItemsView(BuildContext context) {
    return Text("NO ITEMS YET :(");
  }

  Widget _buildBeersView(BuildContext context, List<Beer> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Text(data[index].beerName);
      },
    );
  }
}
