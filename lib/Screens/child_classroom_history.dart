import "package:flutter/material.dart";

class ChildClassroomHistory extends StatefulWidget {
  const ChildClassroomHistory({ super.key});

  @override
  State<ChildClassroomHistory> createState() => _ChildClassroomHistoryState();
}

class _ChildClassroomHistoryState extends State<ChildClassroomHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Title')),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: <Widget>[
          const Text("Select Child"),
          const Text("Show results"),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text("Search"))
        ])))));
  }
}
