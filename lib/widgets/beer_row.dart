import 'package:domowka/models/api/beers_response.dart';
import 'package:flutter/material.dart';

class BeerRow extends StatelessWidget {
  final Beer beer;
  final ValueChanged<Beer> onTap;

  const BeerRow(this.beer, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onTap(beer),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                beer.beerName,
                style: TextStyle(fontSize: 12.0, color: Colors.black54),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(beer.brewery,
                    style: TextStyle(fontSize: 16.0, color: Colors.black)),
              ),
              Text(beer.style,
                  style: TextStyle(fontSize: 12.0, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
