import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Addtoclassroom extends StatefulWidget {
  Addtoclassroom({Key? key}) : super(key: key);

  @override
  _AddtoclassroomState createState() => _AddtoclassroomState();
}

class _AddtoclassroomState extends State<Addtoclassroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add to ClassRoom"),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Child Name"),
                  const Text("Select Classrom"),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                              return HomePage(title: "Homepage");
                            }), (route)=>false);
                          },
                          child: const Text("Add to Classroom")))
                ]),
          ),
        )));
  }
}
