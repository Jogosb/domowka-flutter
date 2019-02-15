import 'package:domowka/blocs/beers/beers_bloc.dart';
import 'package:domowka/blocs/beers/beers_bloc_state.dart';
import 'package:domowka/models/api/beers_response.dart';
import 'package:domowka/widgets/beer_row.dart';
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
      return _buildErrorView(
          context, (snapshot.data as BeersLoadingErrorState).error);
    } else if (snapshot.data is BeersLoadingState) {
      return _buildProgressView(context);
    } else {
      return _buildNoItemsView(context);
    }
  }

  Widget _buildProgressView(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorView(BuildContext context, String error) {
    return Center(
      child: Text("Retrieving beers error! :\n $error"),
    );
  }

  Widget _buildNoItemsView(BuildContext context) {
    return Center(
      child: Text("There are no beers :("),
    );
  }

  Widget _buildBeersView(BuildContext context, List<Beer> data) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.black54, height: 1.0);
      },
      itemCount: data.length,
      itemBuilder: (context, index) {
        return new BeerRow(data[index], _onBeerTap);
      },
    );
  }

 void _onBeerTap(Beer beer) {
    print("on beer tap!");
    print("${beer.beerName}");
  }

}
