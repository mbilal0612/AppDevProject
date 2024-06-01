import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/child_model.dart';
import 'package:project/models/classroom_model.dart';

class ClassroomService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ClassroomModel>> getClassrooms() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('classrooms').get();

      return snapshot.docs
          .map((d) => ClassroomModel.fromQuerySnapshot(d))
          .toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  Future<bool> addClassroom(String name, int startMonth, int duration,
      int capacity, int waitlistCapacity, int noOfMonths) async {
    try {
      if (name.isNotEmpty &&
          startMonth >= 1 &&
          startMonth <= 12 &&
          duration > 0 &&
          capacity > 0 &&
          waitlistCapacity > 0) {
        await _firestore.collection('classrooms').doc(name).set({
          "name": name.toLowerCase(),
          "startMonth": startMonth,
          "noOfMonths": noOfMonths,
          "duration": duration,
          "capacity": capacity,
          "waitlistCapcity": waitlistCapacity,
          "waitList": []
        });
        return true;
      } else {
        print("Incorrect fields");
        return false;
      }
    } catch (e) {
      print("There was an error in adding the class to firestore:$e");
      return false;
    }
  }

  //
  //get class current number of students return -1 if error
  Future<int> addToClassComplete(String uuid, String currentClass) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('childs')
          .where('currentClass', isEqualTo: currentClass)
          .where('isWaitListed', isEqualTo: false)
          .get();

      List<ChildModel> childList = snapshot.docs
          .map((doc) => ChildModel.fromQuerySnapshot(doc))
          .toList();

      int currentlyEnrolled = childList.length;

      DocumentSnapshot<Map<String, dynamic>> clss =
          await _firestore.collection('classrooms').doc(currentClass).get();

      List<dynamic> newWaitList = clss['waitList'] as List<dynamic>;
      List<String> stringList = newWaitList.map((w) => w.toString()).toList();

      clss['waitList'].map((w) => w.toString()).toList();

      ClassroomModel classroomModel = ClassroomModel(
          name: clss['name'],
          startMonth: clss['startMonth'],
          noOfMonths: clss['noOfMonths'],
          capacity: clss['capacity'],
          waitlistCapacity: clss['waitlistCapacity'],
          waitList: stringList);

      int waitListCount = classroomModel.waitList.length;

      if (currentlyEnrolled < classroomModel.capacity) {
        //enroll the child, add child to class
        await _firestore.collection('childs').doc(uuid).update({
          "currentClass": currentClass,
        });
        return 1;
      } else if (waitListCount < classroomModel.waitlistCapacity) {
        //add to waitList and waitList Student
        await addChildToWaitList(uuid, currentClass);
        //
        await _firestore.collection('childs').doc(uuid).update({
          "isWaitListed": true,
        });

        return 2;
      }

      return -1;
    } catch (e) {
      print("There was an error $e");
      return -1;
    }
  }

  Future<void> addChildToWaitList(String uuid, String currentClass) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> clss =
          await _firestore.collection('classrooms').doc(currentClass).get();

      ClassroomModel classroomModel = ClassroomModel(
          name: clss['name'],
          startMonth: clss['startMonth'],
          noOfMonths: clss['noOfMonths'],
          capacity: clss['capacity'],
          waitlistCapacity: clss['waitlistCapacity'],
          waitList: clss['waitList']);

      classroomModel.waitList.add(uuid);

      await _firestore.collection('classrooms').doc(currentClass).update({
        "waitList": classroomModel.waitList,
      });
    } catch (e) {
      print("There was an error $e");
    }
  }
}
