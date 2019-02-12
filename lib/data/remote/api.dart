import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:domowka/models/api/beer.dart';
import 'package:domowka/models/api/beers_response.dart';

class ApiClient {
  ApiClient();

  Future<BeersResponse> fetchBeers() async {
    final response = await http.get(
        'https://ontap.pl/?multitap_id=243&webapi=d928bdaaa3ff9b717edf28764455c799');

    if (response.statusCode == 200) {
      print("SUCCESS $response");
      final jsonResponse = json.decode(response.body);
      BeersResponse beersResponse = new BeersResponse.fromJson(jsonResponse);
      print(beersResponse.name);
      print(beersResponse.taps[0].currentBeer.beerName);
      print(beersResponse.taps[0].currentBeer.prices[0]);

      return null;
    } else {
      print("FAILURE $response");
      throw Exception("Failed to load beers!");
    }
  }
}
