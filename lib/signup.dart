import 'package:flutter/material.dart';
import 'package:project/main.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LoginPage(title: "Login");
            }));
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
