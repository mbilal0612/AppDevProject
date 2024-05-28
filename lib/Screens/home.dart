import 'package:flutter/material.dart';
import 'package:project/screens/add_classroom.dart';
import 'package:project/screens/enroll_child.dart';
import 'package:project/screens/login.dart';

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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddClassroom(title: "Add classroom");
                  }));
                },
                child: const Text('Add Classroom')),
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
