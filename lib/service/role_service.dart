import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/commons/role.dart';

class RoleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //return true if successfull
  Future<bool> addUserRole(String uuid, Role role) async {
    try {
      await _firestore.collection('user_role').doc(uuid).set({
        'uuid': uuid,
        'role': role,
      });
      return true;
    } catch (e) {
      //if not successful then print

      print("Error adding user role to Firestore:$e");
      return false;
    }
  }
}
