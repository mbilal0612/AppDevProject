import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:project/commons/helper_functions.dart";
import "package:project/models/classroom_model.dart";
import "package:project/provider/child_provider.dart";
import "package:project/service/classroom_service.dart";

class ViewClassroom extends ConsumerWidget {
  const ViewClassroom({super.key, required this.classroom});
  final ClassroomModel classroom;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waitListedStudentsNotifier =
        ref.watch(getWaitListedChildrenInClassProvider(classroom.name));
    final enrolledStudentsNotifier =
        ref.watch(getNotWaitListedChildrenInClassProvider(classroom.name));
    final enrolledStudentsCount =
        ref.watch(getNotWaitListedChildrenInClassCountProvider(classroom.name));
    final ClassroomService _classoomService = ClassroomService();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const myTabs = [
      Tab(
        text: 'Enrolled',
      ),
      Tab(text: 'Wait Listed')
    ];
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(classroom.name),
            bottom: const TabBar(tabs: myTabs),
          ),
          body: TabBarView(
            children: myTabs.map((Tab tab) {
              final String label = tab.text!.toString();
              if (label == "Enrolled") {
                return switch (enrolledStudentsNotifier) {
                  AsyncData(:final value) => Container(
                      width: width,
                      height: height,
                      child: ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            print(value![index].fName);
                            var child = value[index];
                            return Card(
                              margin: EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  leading:
                                      const Icon(Icons.child_care, size: 40.0),
                                  title: Text(
                                    '${child.fName} ${child.lName}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8.0),
                                      Text(
                                          'DOB: ${child.dob.toString().split(' ')[0]}'),
                                      Text(
                                          'Age: ${calculateMonths(child.dob)} months'),
                                      Text('Class: ${child.currentClass}'),
                                      Text('Parent UUID: ${child.parentUUID}'),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  AsyncError(:final error) => Text(error.toString()),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    )
                };
              } else {
                return switch (waitListedStudentsNotifier) {
                  AsyncData(:final value) => Container(
                      width: width,
                      height: height,
                      child: ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            print(value![index].fName);
                            var child = value[index];
                            return Card(
                              margin: EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  leading:
                                      const Icon(Icons.child_care, size: 40.0),
                                  title: Text(
                                    '${child.fName} ${child.lName}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8.0),
                                      Text(
                                          'DOB: ${child.dob.toString().split(' ')[0]}'),
                                      Text(
                                          'Age: ${calculateMonths(child.dob)} months'),
                                      Text('Class: ${child.currentClass}'),
                                      Text('Parent UUID: ${child.parentUUID}'),
                                    ],
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        //remove from waitlist if there is room in the class.
                                        enrolledStudentsCount.when(
                                          data: (count) {
                                            if (count < classroom.capacity) {
                                              //remove from waitlist
                                              _classoomService
                                                  .removeChildFromWaitList(
                                                      child.id,
                                                      child.currentClass);
                                            } else {}
                                          },
                                          error: (error, stackTrace) {},
                                          loading: () {},
                                        );
                                      },
                                      icon: const Icon(Icons.remove)),
                                ),
                              ),
                            );
                          }),
                    ),
                  AsyncError(:final error) => Text(error.toString()),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    )
                };
              }
            }).toList(),
          ),
        ));
  }
}
