import 'package:flutter/material.dart';
import 'beers_list.dart';
import 'package:domowka/models/api/beer.dart';
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
          body: Column(
            children: <Widget>[
              Center(
                child: FlatButton(
                  color: Colors.amberAccent,
                  onPressed: () => _fireLoad(),
                  child: new Text("Fetch Me Beers!"),
                ),
              )
            ],
          ),
        ));
  }

  void _fireLoad() {
    beers = ApiClient().fetchBeers();
  }
}
