import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/parent_model.dart';

class ParentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //add parents to firebase
  Future<void> addParent(String firstName, String lastName, String email,
      {List<String> wards = const []}) async {
    try {
      await _firestore.collection('parents').doc(email).set({
        "fName": firstName,
        "lName": lastName,
        "email": email,
        "wards": wards,
      });
    } catch (e) {
      print("error: $e");
    }
  }

  Future<void> addWard(String email, String wardUUID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> parentDocRef =
          await _firestore.collection('parents').doc(email).get();

      Parent parentModel = Parent.fromDocumentSnapshot(parentDocRef);

      parentModel.wards.add(wardUUID);
      await _firestore.collection('parents').doc(email).update({
        "wards": parentModel.wards,
      });
    } catch (e) {
      print("error $e");
    }
  }

  Future<List<Parent>> getAllParentsEmail() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('parents').get();
      List<QueryDocumentSnapshot<Object?>> docs = snapshot.docs;
      List<Parent> parents =
          docs.map((doc) => Parent.fromQuerySnapshot(doc)).toList();
      return parents;
    } catch (e) {
      print("Error $e");
      return [];
    }
  }
}
