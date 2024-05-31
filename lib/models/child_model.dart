import 'package:cloud_firestore/cloud_firestore.dart';

class ChildModel {
  final String fName;
  final String lName;
  final DateTime dob;
  final int noOfMonths;
  //store id of current class
  final String currentClass;
  final String parentUUID;
  bool isWaitListed;

  ChildModel({
    required this.fName,
    required this.lName,
    required this.dob,
    required this.noOfMonths,
    required this.currentClass,
    required this.parentUUID,
    this.isWaitListed = false,
  });

  factory ChildModel.fromQuerySnapshot(QueryDocumentSnapshot doc) {
    final Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    return ChildModel(
      fName: json['fName'] as String,
      lName: json['lName'] as String,
      noOfMonths: json['noOfMonths'] as int,
      dob: (json['dob'] as Timestamp).toDate(),
      currentClass: json['currentClass'],
      parentUUID: json["parentUUID"],
    );
  }
}
