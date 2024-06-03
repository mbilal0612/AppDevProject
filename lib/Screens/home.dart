import 'package:flutter/material.dart';
import 'package:project/Screens/view_classroom.dart';
import 'package:project/Screens/view_classrooms.dart';
import 'package:project/screens/parentView/parent_home.dart';
import 'package:project/screens/view_children.dart';
import 'package:project/screens/add_classroom.dart';
import 'package:project/screens/add_parent.dart';
import 'package:project/screens/enroll_child.dart';
import 'package:project/screens/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin HomePage"),
      ),
      body: SizedBox(
        height: height,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          children: [
            homepageCard(
                context, 'Enroll Child', Icons.child_care, EnrollChild(), 1),
            homepageCard(context, 'Add Classroom', Icons.class_,
                const AddClassroom(), 2),
            homepageCard(context, 'Classrooms', Icons.view_list,
                const ViewClassrooms(), 3),
            homepageCard(context, 'Parent Home', Icons.home,
                const ParentHome(parentEmail: 'parent1@gmail.com'), 4),
            homepageCard(
                context, 'Add Parent', Icons.person_add, const AddParent(), 5),
            homepageCard(
                context, 'Go Back', Icons.arrow_back, const LoginPage(), 6),
          ],
        ),
      ),
    );
  }

  Widget homepageCard(BuildContext context, String title, IconData icon,
      Widget route, int index) {
    Color getColor(int index) {
      if (index % 4 == 0 || index == 1) {
        return const Color(0xFF00d7b3);
      } else if (index % 3 == 0) {
        return const Color(0xFF1ca8f6);
      } else {
        return const Color(0xFFfb7f6b);
      }
    }

    return Card(
      elevation: 10.0,
      color: getColor(index),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return route;
          }));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
