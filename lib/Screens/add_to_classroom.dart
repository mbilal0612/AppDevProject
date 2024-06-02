import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/models/classroom_model.dart';
import 'package:project/provider/classroom_provider.dart';
import 'package:project/screens/home.dart';
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

class AddToClassroom extends ConsumerWidget {
  const AddToClassroom({super.key, required this.uuid});
  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomsNotifier = ref.watch(getAllClassroomsProvider);
    final selectedClassroom = ref.watch(selectedClassroomProvider);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add to ClassRoom"),
      ),
      body: SafeArea(
          child: switch (classroomsNotifier) {
        AsyncData(:final value) => Container(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(uuid),
                      DropdownMenu(
                        width: width - 20,
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
                      const Expanded(child: SizedBox()),
                      // const SizedBox(
                      //   height: 50,
                      // ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (selectedClassroom.isNotEmpty) {
                              try {
                                //update the class
                                await ChildService()
                                    .updateChildClass(uuid, selectedClassroom);

                                await ClassroomService().addToClassComplete(
                                    uuid, selectedClassroom);

                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const HomePage();
                                }), (route) => false);
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
      }),
    );
  }
}
