import 'package:flutter/material.dart';
import 'beers_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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


