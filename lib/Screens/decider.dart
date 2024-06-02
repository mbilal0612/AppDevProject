import 'package:flutter/material.dart';
import 'package:project/screens/login.dart';
import 'package:project/screens/parentView/parent_login.dart';

class Decider extends StatefulWidget {
  const Decider({super.key});

  @override
  State<Decider> createState() => _DeciderState();
}

class _DeciderState extends State<Decider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ParentLoginPage();
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
                      return LoginPage();
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
