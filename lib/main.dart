import 'package:domowka/beers_list.dart';
import 'package:domowka/blocs/beers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:domowka/models/api/beers_response.dart';
import 'package:domowka/data/remote/api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Future<BeersResponse> beers;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Domówka Beer List',
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Domówka Beer List'),
            ),
            body: BeersList(
              bloc: BeersBlocImpl(ApiClient()),
            )));
  }
}
