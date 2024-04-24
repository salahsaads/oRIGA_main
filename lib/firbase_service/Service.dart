import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  CollectionReference prodect =
      FirebaseFirestore.instance.collection('prodect');

  Future<void> addUser_prodect({
    required String name,
    required int point,
    required String image,
  }) {
    // Call the user's CollectionReference to add a new user
    return prodect
        .add({'name': name, 'point': point, 'image': image})
        .then((value) => print("===User Added Prodect"))
        .catchError(
            (error) => print("--------------Failed to add User: $error"));
  }

  CollectionReference waste = FirebaseFirestore.instance.collection('waste');

  Future<void> addUser_waste({
    required String name,
    required int point,
    required String image,
  }) {
    // Call the user's CollectionReference to add a new user
    return waste
        .add({'name': name, 'point': point, 'image': image})
        .then((value) => print("===User Added waste"))
        .catchError(
            (error) => print("--------------Failed to add User: $error"));
  }
}
