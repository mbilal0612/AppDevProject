import "package:flutter/material.dart";

class ViewClassroom extends StatefulWidget {
  const ViewClassroom({super.key});

  @override
  State<ViewClassroom> createState() => _ViewClassroomState();
}

class _ViewClassroomState extends State<ViewClassroom> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [Text("View Classrooms"), Card()],
        ),
      )),
    );
  }
}
