import 'package:cloud_firestore/cloud_firestore.dart';

class Parent {
  // final String uuid;
  final String fName;
  final String lName;
  final String email;
  //just store the uuid of the wards
  final List<String> wards;

  Parent({
    // required this.uuid,
    required this.fName,
    required this.lName,
    required this.email,
    this.wards = const [],
  });

  factory Parent.fromQuerySnapshot(QueryDocumentSnapshot doc) {
    final Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    List<dynamic> tempList = json['wards'] as List<dynamic>;
    List<String> stringList = tempList.map((item) => item.toString()).toList();
    return Parent(
      fName: json['fName'] as String,
      lName: json['lName'] as String,
      email: json['email'] as String,
      wards: stringList,
    );
  }

  factory Parent.fromDocumentSnapshot(DocumentSnapshot doc) {
    List<dynamic> tempList = doc['wards'] as List<dynamic>;
    List<String> stringList = tempList.map((item) => item.toString()).toList();
    return Parent(
      fName: doc['fName'] as String,
      lName: doc['lName'] as String,
      email: doc['email'] as String,
      wards: stringList,
    );
  }
}
