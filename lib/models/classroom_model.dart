import 'package:cloud_firestore/cloud_firestore.dart';

class ClassroomModel {
//   final String uuid;
  final String name;
  final int startMonth;
  final int noOfMonths;
  final int capacity;
  final int waitlistCapacity;
  List<String> waitList;

  ClassroomModel({
    // required this.uuid,
    required this.name,
    required this.startMonth,
    required this.noOfMonths,
    required this.capacity,
    required this.waitlistCapacity,
    this.waitList = const [],
  });

  factory ClassroomModel.fromQuerySnapshot(QueryDocumentSnapshot doc) {
    final Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    //converting list dynamic to list string
    List<String> waitList = (json['waitList'] as List<dynamic>).map(
      (e) {
        return e as String;
      },
    ).toList();
    return ClassroomModel(
        name: json['name'] as String,
        startMonth: json['startMonth'] as int,
        noOfMonths: json['noOfMonths'] as int,
        capacity: json['capacity'] as int,
        waitlistCapacity: json['waitlistCapacity'] as int,
        waitList: waitList);
  }
}
