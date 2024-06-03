import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/commons/helper_functions.dart';
import 'package:project/models/classroom_model.dart';
import 'package:project/provider/child_provider.dart';
import 'package:project/provider/classroom_provider.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/view_classroom.dart';
import 'package:project/service/child_service.dart';
import 'package:project/service/classroom_service.dart';

//to save the current state
class SelectedClassroomNotifier extends StateNotifier<String> {
  SelectedClassroomNotifier() : super("");

  void setClassroom(String value) {
    state = value;
  }

  String get selectedClassroom => state;
}

//create provider for the state
final selectedClassroomProvider =
    StateNotifierProvider<SelectedClassroomNotifier, String>((ref) {
  return SelectedClassroomNotifier();
});

class UpdateClassroom extends ConsumerWidget {
  const UpdateClassroom(
      {super.key, required this.uuid, required this.classroomModel});
  final String uuid;
  final ClassroomModel classroomModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _classroomsNotifier = ref.watch(getAllClassroomsProvider);
    final _selectedClassroom = ref.watch(selectedClassroomProvider);
    final _childById = ref.watch(getChildByIdProvider(uuid));
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add to ClassRoom"),
      ),
      body: SafeArea(
          child: SizedBox(
        height: _height,
        child: Column(
          children: [
            _childById.when(
              data: (child) {
                if (child == null) {
                  return const Center(
                    child: Text("child not found"),
                  );
                } else {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color(0xFFfb7f6b),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(
                          '${child.fName} ${child.lName}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),
                            Text(
                              'DOB: ${child.dob.toString().split(' ')[0]}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Age: ${calculateMonths(child.dob).toString()} months',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Class: ${child.currentClass}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Parent UUID: ${child.parentUUID}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
              error: (error, stackTrace) {
                return const Text('something went wrong');
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            switch (_classroomsNotifier) {
              AsyncData(:final value) => Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            DropdownMenu(
                              width: _width - 20,
                              hintText: "Select a class to add to",
                              dropdownMenuEntries:
                                  value!.map<DropdownMenuEntry<String>>((v) {
                                return DropdownMenuEntry<String>(
                                    value: v.name, label: v.name);
                              }).toList(),
                              onSelected: (value) {
                                ref
                                    .read(selectedClassroomProvider.notifier)
                                    .setClassroom(value ?? "");
                              },
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_selectedClassroom.isNotEmpty) {
                                    try {
                                      //update the class
                                      await ChildService().updateChildClass(
                                          uuid, _selectedClassroom);

                                      await ClassroomService()
                                          .addToClassComplete(
                                              uuid, _selectedClassroom);

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ViewClassroom(
                                            classroom: classroomModel);
                                      }));
                                    } catch (e) {
                                      print("Error: $e");
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  backgroundColor: const Color(0xFF007AFF),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ), // Adjust padding as needed
                                  child: Center(
                                    child: Text(
                                      "Add to Classroom",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              AsyncError(:final error) => Text(error.toString()),
              _ => const Center(
                  child: CircularProgressIndicator(),
                )
            },
          ],
        ),
      )),
    );
  }
}
