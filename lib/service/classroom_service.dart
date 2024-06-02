import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/child_model.dart';
import 'package:project/models/classroom_model.dart';

class ClassroomService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get all classrooms
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

  //add a new classroom
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

  //Adds to classroom if current count less than capacity otherwise waitlist otherwise return -1
  Future<int> addToClassComplete(String uuid, String classroom) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('childs')
          .where('currentClass', isEqualTo: classroom)
          .where('isWaitListed', isEqualTo: false)
          .get();

      List<ChildModel> childList = snapshot.docs
          .map((doc) => ChildModel.fromQuerySnapshot(doc))
          .toList();

      int currentlyEnrolled = childList.length;

      DocumentSnapshot<Map<String, dynamic>> clss =
          await _firestore.collection('classrooms').doc(classroom).get();

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
          "currentClass": classroom,
        });
        return 1;
      } else if (waitListCount < classroomModel.waitlistCapacity) {
        //add to waitList and waitList Student
        await addChildToWaitList(uuid, classroom);
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

  Future<void> addChildToWaitList(String uuid, String classroom) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await _firestore.collection('classrooms').doc(classroom).get();

      ClassroomModel classroomModel = ClassroomModel(
          name: docSnapshot['name'],
          startMonth: docSnapshot['startMonth'],
          noOfMonths: docSnapshot['noOfMonths'],
          capacity: docSnapshot['capacity'],
          waitlistCapacity: docSnapshot['waitlistCapacity'],
          waitList: docSnapshot['waitList']);

      classroomModel.waitList.add(uuid);

      await _firestore.collection('classrooms').doc(classroom).update({
        "waitList": classroomModel.waitList,
      });
    } catch (e) {
      print("There was an error $e");
    }
  }

  Future<void> removeChildFromWaitList(String uuid, String classroom) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await _firestore.collection('classrooms').doc(classroom).get();

      List<dynamic> tempList = docSnapshot['waitList'] as List<dynamic>;
      List<String> stringList =
          tempList.map((item) => item.toString()).toList();

      ClassroomModel classroomModel = ClassroomModel(
          name: docSnapshot['name'],
          startMonth: docSnapshot['startMonth'],
          noOfMonths: docSnapshot['noOfMonths'],
          capacity: docSnapshot['capacity'],
          waitlistCapacity: docSnapshot['waitlistCapacity'],
          waitList: stringList);

      classroomModel.waitList.remove(uuid);
      await _firestore.collection('classrooms').doc(classroom).update({
        "waitList": classroomModel.waitList,
      });

      await _firestore.collection('childs').doc(uuid).update({
        "isWaitListed": false,
      });
    } catch (e) {
      print("There was an error $e");
    }
  }
}
