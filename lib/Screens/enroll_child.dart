import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/provider/parent_provider.dart';
import 'package:project/screens/add_to_classroom.dart';
import 'package:project/service/child_service.dart';
import 'package:project/service/parent_service.dart';

//to save the current state
class SelectedEmailNotifier extends StateNotifier<String> {
  SelectedEmailNotifier() : super("");

  void setEmail(String value) {
    state = value;
  }

  String get selectedEmail => state;
}

//create provider for the state
final selectedEmailProvider =
    StateNotifierProvider<SelectedEmailNotifier, String>((ref) {
  return SelectedEmailNotifier();
});

class EnrollChild extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  DateTime? _selectedDate;

  EnrollChild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentEmailNotifier = ref.watch(getAllParentsEmailsProvider);
    final selectedEmail = ref.watch(selectedEmailProvider);
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Child"),
          backgroundColor: const Color(0xFF007AFF),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            // height: height,
            // width: width,
            child: switch (parentEmailNotifier) {
              AsyncData(:final value) => Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "First Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Last Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputDatePickerFormField(
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        onDateSaved: (date) {
                          _selectedDate = date;
                        },
                        onDateSubmitted: (date) {
                          _selectedDate = date;
                        },
                        errorInvalidText: "Please enter a valid",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownMenu(
                        width: width - 20,
                        leadingIcon: const Icon(Icons.email),
                        hintText: "Select Parent Email",
                        dropdownMenuEntries:
                            value.map<DropdownMenuEntry<String>>((v) {
                          return DropdownMenuEntry<String>(
                              value: v.email, label: v.email);
                        }).toList(),
                        onSelected: (value) {
                          ref
                              .read(selectedEmailProvider.notifier)
                              .setEmail(value ?? "");
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          //if child enrolled succesfully, move to enroll child to class page
                          try {
                            if (_formKey.currentState!.validate()) {
                              //to save the date if it is not changed
                              _formKey.currentState!.save();
                              // If the form is valid, process the data.
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data: ')));

                              String success = await ChildService().addChild(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _selectedDate!,
                                    ref
                                        .read(selectedEmailProvider.notifier)
                                        .selectedEmail,
                                  ) ??
                                  "";

                              if (success.isNotEmpty) {
                                await ParentService().addWard(
                                    ref
                                        .read(selectedEmailProvider.notifier)
                                        .selectedEmail,
                                    success);
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AddToClassroom(uuid: success);
                                }), (route) => false);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Error '),
                                  backgroundColor: Colors.redAccent,
                                ));
                              }

                              // Here you can also send the data to a server or save it in a database.
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Error ')));
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
                              "Add Child",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              AsyncError(:final error) => Text(error.toString()),
              _ => const Center(
                  child: CircularProgressIndicator(),
                )
            },
          ),
        ))));
  }
}
