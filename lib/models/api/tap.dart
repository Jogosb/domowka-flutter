import 'beer.dart';

class Tap {
  final int id;
  final Beer currentBeer;

  Tap({this.id, this.currentBeer});

  factory Tap.fromJson(Map<String, dynamic> json) {
    var currentBeerJson = json['current_beer'];
    Beer currentBeer = currentBeerJson.cast<Beer>();

    return new Tap(
      id: json['id'],
      currentBeer: currentBeer,
    );
  }
}
