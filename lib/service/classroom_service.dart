import 'package:cloud_firestore/cloud_firestore.dart';
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
