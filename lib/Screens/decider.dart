import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/commons/role.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/login.dart';
import 'package:project/screens/parentView/parent_home.dart';
import 'package:project/service/auth_service.dart';
import 'package:project/service/role_service.dart';

class Decider extends StatefulWidget {
  const Decider({super.key});

  @override
  State<Decider> createState() => _DeciderState();
}

class _DeciderState extends State<Decider> {
  final AuthService _authService = AuthService();
  final RoleService _roleService = RoleService();

  @override
  Widget build(BuildContext context) {
    void loginGoogle() async {
      print("Attempting login");
      //login with google
      User? user = await _authService.signInWithGoogle();
      if (user != null) {
        //to make sure that the widget is mounted when we switch contexts
        //add user to user Roles with admin rights
        var role = _roleService.checkUserRole(user.email!);

        if (role == "") {
          _roleService.addUserRole(user.email!, Role.parent);
        } else if (role == "parent") {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return ParentHome(parentEmail: user.email!);
          }), (route) => false);
        } else if (role == "admin") {
          if (!mounted) return;
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return const HomePage();
          }), (route) => false);
        }
      } else {
        print("There was an error: user == null");

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Error ',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ));
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: loginGoogle,
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    backgroundColor: const Color(0xFF007AFF),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ), // Adjust padding as needed
                    child: Center(
                      child: Text(
                        "Parent",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    backgroundColor: const Color(0xFF007AFF),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ), // Adjust padding as needed
                    child: Center(
                      child: Text(
                        "Admin",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
