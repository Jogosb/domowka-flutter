import 'beer.dart';

class Tap {
  final String id;
  final Beer currentBeer;

  Tap({this.id, this.currentBeer});

  factory Tap.fromJson(Map<String, dynamic> json) {
    return new Tap(
      id: json['id'],
      currentBeer: Beer.fromJson(json['current_beer']),
    );
  }
}
