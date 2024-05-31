import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/Screens/view_classroom.dart';
import 'package:project/provider/classroom_provider.dart';

class ViewClassrooms extends ConsumerWidget {
  const ViewClassrooms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomsNotifier = ref.watch(getAllClassroomsProvider);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: switch (classroomsNotifier) {
        AsyncData(:final value) => Container(
            width: width,
            height: height,
            child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  print(value![index].name);
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ViewClassroom(
                          classroom: value[index],
                        );
                      }));
                    },
                    leading: const Icon(Icons.class_rounded),
                    title: Text(value![index].name),
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
