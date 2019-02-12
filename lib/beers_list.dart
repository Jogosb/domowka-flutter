import 'package:domowka/blocs/beers_bloc.dart';
import 'package:domowka/models/api/beers_response.dart';
import 'package:flutter/material.dart';

class BeersList extends StatelessWidget {
  final BeersBloc bloc;

  const BeersList({Key key, @required this.bloc})
      : assert(bloc != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CurrentBeer>>(
      stream: bloc.beers,
      builder: _buildView,
    );
  }

  Widget _buildView(
      BuildContext context, AsyncSnapshot<List<CurrentBeer>> snapshot) {
    if (snapshot.hasData && snapshot.data.length > 0) {
      print("BuildView with beers!"); 
      return _buildBeersView(context, snapshot.data);
    } else {
      print("BuildView with nothing :(!"); 
      return _buildNoItemsView(context);
    }
  }

  Widget _buildNoItemsView(BuildContext context) {
    return Text("NO ITEMS YET :(");
  }

  Widget _buildBeersView(BuildContext context, List<CurrentBeer> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Text(data[index].beerName);
      },
    );
  }
}
