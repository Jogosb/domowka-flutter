class Beer {
  final String beerName;
  final String brewery;
  final String style;
  final String ibu;
  final String blg;
  final String abv;
  final String image;
  final List<double> prices; 

  Beer({this.beerName, this.brewery, this.style, this.ibu, this.blg, this.abv, this.image, this.prices});

  factory Beer.fromJson(Map<String, dynamic> json) {
    
    var pricesFromJson = json['prices'];
    List<double> priceList = pricesFromJson.cast<double>();

    return Beer(
      beerName: json['beer_name'],
      brewery: json['brewery'],
      style: json['style'],
      ibu: json['ibu'],
      blg: json['blg'],
      abv: json['abv'],
      image: json['abv'],
      prices: priceList
    );
  }
}
