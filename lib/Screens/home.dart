import 'package:flutter/material.dart';
import 'package:project/Screens/enroll_child.dart';
import 'package:project/Screens/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EnrollChild(title: "Enroll Child");
                  }));
                },
                child: const Text('Enroll Child')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage(title: "Homepage");
                }));
              },
              child: const Text('Go Back'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage(title: "Homepage");
                }));
              },
              child: const Text('Go Back'),
            )
          ],
        ),
      ),
    );
  }
}
