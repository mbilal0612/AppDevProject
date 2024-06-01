import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:project/models/classroom_model.dart";
import "package:project/provider/child_provider.dart";

class ParentHome extends ConsumerWidget {
  const ParentHome({super.key, required this.classroom});
  final ClassroomModel classroom;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsNotifier =
        ref.watch(getChildrenInClassroomProvider(classroom.name));
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: switch (studentsNotifier) {
        AsyncData(:final value) => Container(
            width: width,
            height: height,
            child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  print(value![index].fName);
                  return ListTile(
                    // onTap: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) {
                    //     // return ViewClassroom(
                    //     //   classroom: value[index],
                    //     // );
                    //   }));
                    // },
                    leading: const Icon(Icons.class_rounded),
                    title: Text(value![index].fName),
                    trailing: const Icon(
                      CupertinoIcons.delete_left_fill,
                      color: Colors.red,
                    ),
                  );
                }),
          ),
        AsyncError(:final error) => Text(error.toString()),
        _ => const Center(
            child: CircularProgressIndicator(),
          )
      }),
    );
  }
}
