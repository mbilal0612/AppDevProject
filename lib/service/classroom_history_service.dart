import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/commons/action.dart';

class ClassroomHistoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addToHistory(String childUUID, Action action) async {
    try {
      _firestore.collection('classroom_history').add(
          {"childUUID": childUUID, "action": action, "time": DateTime.now()});
      return;
    } catch (e) {
      print("There was an error ;$e");
      return;
    }
  }
}
