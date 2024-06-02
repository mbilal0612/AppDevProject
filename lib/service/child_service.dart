import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/child_model.dart';

class ChildService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addChild(
      String fname, String lname, DateTime dob, String parentUUID,
      {String currClass = ""}) async {
    try {
      DocumentReference doc = await _firestore.collection('childs').add({
        "fName": fname,
        "lName": lname,
        "dob": dob,
        "noOfMonths": 1,
        "currentClass": currClass,
        "parentUUID": parentUUID,
        "isWaitListed": false,
      });
      //add id as well
      await _firestore.collection('childs').doc(doc.id).update({
        "id": doc.id,
      });

      //returning the uuid
      return doc.id;
    } catch (e) {
      print("Error in adding child to firebase: $e");
      return "";
    }
  }

  Future<List<Map<String, dynamic>>?> getChildren() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('childs').get();
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

  Future<ChildModel?> getChildById(uuid) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('childs').doc(uuid).get();

      if (docSnapshot.exists) {
        ChildModel childModel = ChildModel.fromDocumentSnapshot(docSnapshot);
        return childModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Error in getting childs details $e");
      return null;
    }
  }

  Future<List<ChildModel>> getChildByParentEmail(email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> docSnapshot = await _firestore
          .collection('childs')
          .where('parentUUID', isEqualTo: email)
          .get();

      List<ChildModel> childModels = docSnapshot.docs
          .map((doc) => ChildModel.fromQuerySnapshot(doc))
          .toList();

      return childModels;
    } catch (e) {
      print("Error in getting childs details $e");
      return [];
    }
  }

  Future<void> updateChildClass(String uuid, String currentClass) async {
    try {
      await _firestore.collection('childs').doc(uuid).update({
        "currentClass": currentClass,
      });
    } catch (e) {
      print("Error while upating $e");
    }
  }

  Future<List<ChildModel>> getChildrenInClass(String classroom) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('childs')
          .where('currentClass', isEqualTo: classroom)
          .get();

      print("ITs gettign here");

      List<ChildModel> childList = snapshot.docs
          .map((doc) => ChildModel.fromQuerySnapshot(doc))
          .toList();

      return childList;
      // querySnapshot.map
      // Process the querySnapshot here
    } catch (e) {
      print("There is an error $e");
      return [];
    }
  }

  Future<List<ChildModel>> getWaitListedChildrenInClass(
      String classroom) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('childs')
          .where('currentClass', isEqualTo: classroom)
          .where('isWaitListed', isEqualTo: true)
          .get();

      List<ChildModel> childList = snapshot.docs
          .map((doc) => ChildModel.fromQuerySnapshot(doc))
          .toList();

      return childList;
      // querySnapshot.map
      // Process the querySnapshot here
    } catch (e) {
      print("There is an error $e");
      return [];
    }
  }

  Future<List<ChildModel>> getNotWaitListedChildrenInClass(
      String classroom) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('childs')
          .where('currentClass', isEqualTo: classroom)
          .where('isWaitListed', isEqualTo: false)
          .get();

      List<ChildModel> childList = snapshot.docs
          .map((doc) => ChildModel.fromQuerySnapshot(doc))
          .toList();

      return childList;
      // querySnapshot.map
      // Process the querySnapshot here
    } catch (e) {
      print("There is an error $e");
      return [];
    }
  }

  Future<int> getNotWaitListedChildrenInClassCount(String classroom) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('childs')
          .where('currentClass', isEqualTo: classroom)
          .where('isWaitListed', isEqualTo: false)
          .get();

      List<ChildModel> childList = snapshot.docs
          .map((doc) => ChildModel.fromQuerySnapshot(doc))
          .toList();

      return childList.length;
      // querySnapshot.map
      // Process the querySnapshot here
    } catch (e) {
      print("There is an error $e");
      return -1;
    }
  }
}
