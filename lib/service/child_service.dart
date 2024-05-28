import 'package:cloud_firestore/cloud_firestore.dart';

class ChildService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addChild(String fname, String lname, DateTime dob) async {
    try {
      await _firestore
          .collection('child')
          .doc()
          .set({"fname": fname, "lanme": lname, "dob": dob});
    } catch (e) {
      print("Error in adding child to firebase: $e");
    }
  }

  Future<List<Map<String, dynamic>>?> getChildren() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('child').get();
      List<QueryDocumentSnapshot> docs = snapshot.docs;

      List<Map<String, dynamic>> children = [];
      for (var doc in docs) {
        children.add(doc.data() as Map<String, dynamic>);
      }

      return children;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getChildById(uuid) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('child').doc(uuid).get();

      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>?;
      } else {
        return null;
      }
    } catch (e) {
      print("Error in getting child details $e");
      return null;
    }
  }
}
