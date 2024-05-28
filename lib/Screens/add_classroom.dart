import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screens/add_to_classroom.dart';
import 'package:project/service/classroom_service.dart';

class AddClassroom extends StatefulWidget {
  const AddClassroom({super.key, required this.title});
  final String title;
  @override
  State<AddClassroom> createState() => _AddClassroomState();
}

class _AddClassroomState extends State<AddClassroom> {
  final ClassroomService classroomService = ClassroomService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startMonthController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _waitListController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Classroom'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Class Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _startMonthController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Start Month:1 for jan, 12 for dec"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      final number = int.tryParse(value);
                      if (number == null) {
                        return 'Invalid number';
                      }
                      if (number < 1 || number > 12) {
                        return 'Number must be between 1 and 12';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _durationController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "No of Months"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      final number = int.tryParse(value);
                      if (number == null) {
                        return 'Invalid number';
                      }
                      if (number < 0 || number > 100) {
                        return 'Number must be between 1 and 100';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _capacityController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: "Capacity"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      final number = int.tryParse(value);
                      if (number == null) {
                        return 'Invalid number';
                      }
                      if (number < 1 || number > 40) {
                        return 'Number must be between 1 and 40';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _waitListController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "WaitList Capacity"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      final number = int.tryParse(value);
                      if (number == null) {
                        return 'Invalid number';
                      }
                      if (number < 0 || number > 10) {
                        return 'Number must be between 0 and 10';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, process the data.
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Processing Data: ')));

                          bool success = await classroomService.addClassroom(
                              _nameController.text,
                              int.parse(_startMonthController.text),
                              int.parse(_durationController.text),
                              int.parse(_capacityController.text),
                              int.parse(_waitListController.text));

                          if (success) {
                            if (!mounted) return;
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return Addtoclassroom();
                            }), (route) => false);
                          } else {
                            if (!mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Error ')));
                          }

                          // Here you can also send the data to a server or save it in a database.
                        }
                        //if child enrolled succesfully, move to enrol child to class page
                      },
                      child: const Text("Add Classroom"))
                ],
              ),
            ),
          ),
        )));
  }
}
