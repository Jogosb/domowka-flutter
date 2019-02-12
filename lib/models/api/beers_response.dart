import 'tap.dart';

class BeersResponse {
  final String name;
  final List<Tap> taps;

  BeersResponse({this.name, this.taps});

  factory BeersResponse.fromJson(Map<String, dynamic> json) {
    
    var list = json['taps'] as List;
    List<Tap> tapList = list.map((i) => Tap.fromJson(i)).toList();
    return new BeersResponse(
      name: json['name'],
      taps: tapList,
    );
  }
}
