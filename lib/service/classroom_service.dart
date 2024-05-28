import 'package:cloud_firestore/cloud_firestore.dart';

class ClassroomService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void getClassrooms() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('classrooms').doc().get();
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<bool> addClassroom(String name, int startMonth, int duration,
      int capacity, int waitlistCapacity) async {
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
          "duration": duration,
          "capacity": capacity,
          "waitlist": waitlistCapacity,
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
}
