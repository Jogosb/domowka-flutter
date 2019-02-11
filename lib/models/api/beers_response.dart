import 'tap.dart';

class BeersResponse {
  final String name;
  final List<Tap> taps;

  BeersResponse({this.name, this.taps});

  factory BeersResponse.fromJson(Map<String, dynamic> json) {
    return new BeersResponse(
      name: json['name'],
      taps: json['taps'],
    );
  }
}
