import 'dart:convert';

BeersResponse welcomeFromJson(String str) {
    final jsonData = json.decode(str);
    return BeersResponse.fromJson(jsonData);
}

String welcomeToJson(BeersResponse data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class BeersResponse {
    String name;
    List<Tap> taps;

    BeersResponse({
        this.name,
        this.taps,
    });

    factory BeersResponse.fromJson(Map<String, dynamic> json) => new BeersResponse(
        name: json["name"],
        taps: new List<Tap>.from(json["taps"].map((x) => Tap.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "taps": new List<dynamic>.from(taps.map((x) => x.toJson())),
    };
}

class Tap {
    String id;
    Beer currentBeer;

    Tap({
        this.id,
        this.currentBeer,
    });

    factory Tap.fromJson(Map<String, dynamic> json) => new Tap(
        id: json["id"],
        currentBeer: Beer.fromJson(json["current_beer"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "current_beer": currentBeer.toJson(),
    };
}

class Beer {
    String beerName;
    String brewery;
    String style;
    String ibu;
    String blg;
    String abv;
    String image;
    List<String> prices;

    Beer({
        this.beerName,
        this.brewery,
        this.style,
        this.ibu,
        this.blg,
        this.abv,
        this.image,
        this.prices,
    });

    factory Beer.fromJson(Map<String, dynamic> json) => new Beer(
        beerName: json["beer_name"],
        brewery: json["brewery"],
        style: json["style"],
        ibu: json["ibu"] == null ? null : json["ibu"],
        blg: json["blg"] == null ? null : json["blg"],
        abv: json["abv"] == null ? null : json["abv"],
        image: json["image"],
        prices: new List<String>.from(json["prices"].map((x) => x == null ? null : x)),
    );

    Map<String, dynamic> toJson() => {
        "beer_name": beerName,
        "brewery": brewery,
        "style": style,
        "ibu": ibu == null ? null : ibu,
        "blg": blg == null ? null : blg,
        "abv": abv == null ? null : abv,
        "image": image,
        "prices": new List<dynamic>.from(prices.map((x) => x == null ? null : x)),
    };
}
