import 'package:flutter/material.dart';
import 'package:project/main.dart';

class EnrollChild extends StatelessWidget {
  const EnrollChild({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        const Text(
          "Sign In",
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const Divider(
          thickness: 2.0,
          indent: 100.0,
          endIndent: 14.0,
          color: Colors.blue,
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LoginPage(title: "Login");
            }));
          },
          child: const Text('Go Back'),
        )
      ]),
    ));
  }
}
