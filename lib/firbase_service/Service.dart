// ignore_for_file: equal_keys_in_map

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
        .add({
          'name': name,
          'point': point,
          'image': image,
          'CreateTime': DateTime.now(),
        })
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
        .add({
          'name': name,
          'point': point,
          'image': image,
          'CreateTime': DateTime.now(),
        })
        .then((value) => print("===User Added waste"))
        .catchError(
            (error) => print("--------------Failed to add User: $error"));
  }

  void delete_service1(String name) async {
    try {
      // Reference to the collection
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('prodect')
              .where('name', isEqualTo: name)
              .get();

      // Check if any documents were found
      if (querySnapshot.docs.isNotEmpty) {
        // Loop through the documents (there should be only one matching document in this case)
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in querySnapshot.docs) {
          // Get the document reference and delete it
          await FirebaseFirestore.instance
              .collection('prodect')
              .doc(doc.id)
              .delete();
        }
      } else {}
    } catch (e) {
      print('Error deleting document: $e');
      // Handle error as needed
    }
  }

  void delete_service2(String name) async {
    try {
      // Reference to the collection
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('waste')
              .where('name', isEqualTo: name)
              .get();

      // Check if any documents were found
      if (querySnapshot.docs.isNotEmpty) {
        // Loop through the documents (there should be only one matching document in this case)
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in querySnapshot.docs) {
          // Get the document reference and delete it
          await FirebaseFirestore.instance
              .collection('waste')
              .doc(doc.id)
              .delete();
        }
      } else {}
    } catch (e) {
      print('Error deleting document: $e');
      // Handle error as needed
    }
  }

 Future<String> Add_point({required String phone, required int point}) async {
    try {
      var collectionName = 'users'; // Replace with your collection name

      // Query 'image_work_all' collection to find the document with the matching email
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection(collectionName)
              .where('phoneNumber', isEqualTo: phone)
              .get();

      // Check if any documents match the query
      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document (assuming there's only one document per email)
        var imageWorkDocument = querySnapshot.docs.first;

        // Extract the document ID from the 'image_work_all' collection
        var docId = imageWorkDocument.id;

        // Reference the document in the 'users' collection using the extracted docId
        var docRef =
            FirebaseFirestore.instance.collection(collectionName).doc(docId);

        // Use set with merge option to add/update the 'url' field in the 'users' document
        await docRef.update({
          'point': point,
        });
print('Field added successfully!');
        return 'yes';
        
      } else {
        print('No document found in image_work_all with phone: $phone');
        return 'no';
      }
    } catch (e) {
      print('Error adding point: $e');        return 'no';

    }
  }
}
