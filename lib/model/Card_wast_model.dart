class Card_Prodect_Waste {
  final String name;
  final int point;
  final String image;

  Card_Prodect_Waste(
      {required this.image, required this.name, required this.point});
  factory Card_Prodect_Waste.fromJson(json) {
    return Card_Prodect_Waste(
        name: json['name'], point: json['point'], image: json['image']);
  }
}
