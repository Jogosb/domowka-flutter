import 'tap.dart';

class BeersResponse {
  final String name;
  final List<Tap> taps;

  BeersResponse({this.name, this.taps});

  factory BeersResponse.fromJson(Map<String, dynamic> json) {
    
    var tapsFromJson = json['taps'];
    List<Tap> tapList = tapsFromJson.cast<Tap>();
    return new BeersResponse(
      name: json['name'],
      taps: tapList,
    );
  }
}
