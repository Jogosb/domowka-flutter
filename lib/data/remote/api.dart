import 'package:http/http.dart' as http;
import 'package:domowka/models/api/beer.dart';

class ApiClient {
  ApiClient();

  Future<List<Beer>> fetchBeers() async {
    final response = await http.get(
        'https://ontap.pl/?multitap_id=243&webapi=d928bdaaa3ff9b717edf28764455c799');

    if (response.statusCode == 200) {
      print("SUCCESS $response");
      final list = new List(1);
      list[0] = Beer(
          abv: "",
          beerName: "name",
          blg: "",
          brewery: "brew",
          ibu: "ibu",
          image: "e",
          prices: new List(1),
          style: "");
      return list;
    } else {
      print("FAILURE $response");
      throw Exception("Failed to load beers!");
    }
  }
}
