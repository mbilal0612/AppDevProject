import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/parent_model.dart';

class ParentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //add parents to firebase
  Future<void> addParent(firstName, lastName, email,
      {List<String> wards = const []}) async {
    try {
      await _firestore.collection('parents').doc().set({
        "fName": firstName,
        "lName": lastName,
        "email": email,
        "wards": wards,
      });
    } catch (e) {
      print("error: $e");
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
