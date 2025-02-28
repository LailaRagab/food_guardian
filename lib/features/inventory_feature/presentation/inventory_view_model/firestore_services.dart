// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class FirestoreServices {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   CollectionReference getItemsCollection(String userID, String category) {
//     return firestore.collection("Users").doc(userID).collection(category);
//   }
//
//   Future<void> addItem({
//     required String userID,
//     required String category,
//     required Map<String, dynamic> itemData,
//   }) async {
//     CollectionReference items = getItemsCollection(userID, category);
//
//     await items.add(itemData);
//   }
//
//   Future<QuerySnapshot> fetchItems({
//     required String userID,
//     required String category,
//   }) async {
//     CollectionReference items = getItemsCollection(userID, category);
//     return await items.get();
//   }
// }
