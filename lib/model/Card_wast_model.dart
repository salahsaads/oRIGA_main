class Card_Prodect_Waste {
  final String name;
  final String point;
  final String image;

  Card_Prodect_Waste(
      {required this.image, required this.name, required this.point});
  factory Card_Prodect_Waste.fromJson(Map<String, dynamic> json) {
    return Card_Prodect_Waste(
        name: json['name'], point: json['point'], image: json['image']);
  }
}
