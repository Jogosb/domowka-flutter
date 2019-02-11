import 'package:flutter/material.dart';
import 'beers_list.dart';
import 'package:domowka/models/api/beer.dart';
import 'package:domowka/data/remote/api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<List<Beer>> beers; 
//   @override
//   void initState() {
//     FutureBuilder<List<Beer>>(
//   future: ApiClient().fetchBeers(),
//   builder: (context, snapshot) {
//     // By default, show a loading spinner
//     return CircularProgressIndicator();
//   },
// );

//   }


  @override
  Widget build(BuildContext context) {
    beers = ApiClient().fetchBeers(); 
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Domówka Beer List',
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Domówka Beer List'),
          ),
          body: BeersList(),
        ));
  }
}