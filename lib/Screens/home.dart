import 'package:flutter/material.dart';
import 'package:project/Screens/view_classroom.dart';
import 'package:project/Screens/view_classrooms.dart';
import 'package:project/screens/view_children.dart';
import 'package:project/screens/add_classroom.dart';
import 'package:project/screens/add_parent.dart';
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
                    return EnrollChild();
                  }));
                },
                child: const Text('Enroll Child')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddClassroom(title: "Add classroom");
                  }));
                },
                child: const Text('Add Classroom')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ViewClassrooms();
                  }));
                },
                child: const Text('View all Classrooms')),
            // TextButton(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return const ViewStudent();
            //       }));
            //     },
            //     child: const Text('View all students')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddParent();
                  }));
                },
                child: const Text('Add Parent')),
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
