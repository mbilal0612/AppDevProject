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

    Color getColor(int currentCount, maxCapacity) {
      if ((currentCount * 1.00) / (maxCapacity * 1.00) >= 0.90) {
        return Colors.redAccent;
      } else if ((currentCount * 1.00) / (maxCapacity * 1.00) < 0.90 &&
          (currentCount * 1.00) / (maxCapacity * 1.00) >= 0.60) {
        return Colors.yellowAccent;
      } else {
        return Colors.greenAccent;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Classrooms"),
      ),
      body: SafeArea(
          child: switch (classroomsNotifier) {
        AsyncData(:final value) => Container(
            width: width,
            height: height,
            child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  print(value![index].name);
                  var classroom = value[index];

                  return Card(
                    color: getColor(
                        classroom.waitList.length, classroom.waitlistCapacity),
                    child: Column(
                      children: [
                        InkWell(
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ViewClassroom(
                                    classroom: classroom,
                                  );
                                }),
                              );
                            },
                            leading: const Icon(
                              Icons.class_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Text(
                                classroom.name,
                                style: const TextStyle(fontSize: 25.0),
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text("Capacity: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(classroom.capacity.toString())
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("WaitListed: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(classroom.waitList.length.toString())
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "WaitList Capacity: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(classroom.waitlistCapacity.toString())
                                  ],
                                ),
                              ],
                            ),
                            trailing: const Icon(
                              CupertinoIcons.eye_fill,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     Expanded(
                        //       child: TextButton(
                        //         onPressed: () {
                        //           // Handle the first button action
                        //         },
                        //         child: const Text('Weight Enrolled'),
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: TextButton(
                        //         onPressed: () {
                        //           // Handle the second button action
                        //         },
                        //         child: const Text('Button 2'),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
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
