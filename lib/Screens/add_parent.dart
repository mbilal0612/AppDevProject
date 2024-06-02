import 'package:flutter/material.dart';
import 'package:project/screens/add_to_classroom.dart';
import 'package:project/screens/home.dart';
import 'package:project/service/child_service.dart';
import 'package:project/service/parent_service.dart';

class AddParent extends StatefulWidget {
  const AddParent({super.key});

  @override
  State<AddParent> createState() => _AddParentState();
}

class _AddParentState extends State<AddParent> {
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime? _selectedDate;

  // void _onSubmit() {
  //   if (_formKey.currentState!.validate()) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Parent'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
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
                          border: OutlineInputBorder(), labelText: "Last Name"),
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
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          caseSensitive: false,
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }

                        return null;
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

                            await ParentService().addParent(
                                _firstNameController.text.trim(),
                                _lastNameController.text.trim(),
                                _emailController.text.trim());

                            if (!mounted) return;
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }), (route) => false);

                            // Here you can also send the data to a server or save it in a database.
                          }
                        } catch (e) {
                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Error ')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        backgroundColor: const Color(0xFF007AFF),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ), // Adjust padding as needed
                        child: Center(
                          child: Text(
                            "Add Parent",
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
            ),
          ),
        )));
  }
}
