class Card_Prodect_Model {
  final String name;
  final int point;
  final String image;

  Card_Prodect_Model(
      {required this.image, required this.name, required this.point});
  factory Card_Prodect_Model.fromJson( json) {
    return Card_Prodect_Model(
        name: json['name'], point: json['point'], image: json['image']);
  }
}
