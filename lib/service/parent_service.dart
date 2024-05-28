import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //add parents to firebase
  void addParent(firstName, lastName) async {
    try {
      await _firestore.collection('parents').doc().set({
        "fname": firstName,
        "lname": lastName,
        "children": [],
      });
    } catch (e) {
      print("error: $e");
    }
  }
}
