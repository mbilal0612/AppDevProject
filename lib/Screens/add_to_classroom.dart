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
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(uuid),
                    DropdownMenu(
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
                              if (selectedClassroom.isNotEmpty) {
                                try {
                                  //update the class
                                  await ChildService().updateChildClass(
                                      uuid, selectedClassroom);

                                  await ClassroomService().addToClassComplete(
                                      uuid, selectedClassroom);

                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const HomePage(title: "Homepage");
                                  }), (route) => false);
                                } catch (e) {
                                  print("Error: $e");
                                }
                              }
                            },
                            child: const Text("Add to Classroom")))
                  ]),
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

class AddToClassForm extends StatelessWidget {
  const AddToClassForm({
    super.key,
    required this.value,
  });
  final List<ClassroomModel> value;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Child Name"),
            DropdownMenu(
              dropdownMenuEntries: value.map<DropdownMenuEntry<String>>((v) {
                return DropdownMenuEntry<String>(value: v.name, label: v.name);
              }).toList(),
              onSelected: (newValue) {},
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomePage(title: "Homepage");
                      }), (route) => false);
                    },
                    child: const Text("Add to Classroom")))
          ]),
    );
  }
}

class DropDownMenuItem {}
