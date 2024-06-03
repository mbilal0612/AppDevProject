import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:project/commons/helper_functions.dart";
import "package:project/models/classroom_model.dart";
import "package:project/provider/child_provider.dart";

class ParentHome extends ConsumerWidget {
  const ParentHome({super.key, required this.parentEmail});
  final String parentEmail;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsNotifier =
        ref.watch(GetChildrenByParentEmailProvider(parentEmail));

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Divider(
                      color: Colors.blue,
                      height: 2,
                      thickness: 2,
                      indent: 10,
                      endIndent: 315,
                    ),
                  ),

                  //parentEmail
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
                        child: Text(
                          parentEmail,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              studentsNotifier.when(data: (value) {
                if (value.isEmpty) {
                  return const Center(
                    child: Text("No children"),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          print(value![index].fName);
                          final child = value![index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                leading: Icon(Icons.child_care,
                                    size: 70,
                                    color: Theme.of(context).primaryColor),
                                title: Text(
                                  '${child.fName} ${child.lName}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DOB: ${child.dob.toString().split(" ")[0]}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Age: ${calculateMonths(child.dob)} months',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Class: ${child.currentClass}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: child.isWaitListed
                                    ? Chip(
                                        label: const Text(
                                          'Waitlisted',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        backgroundColor: Colors.blue.shade50,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 0),
                                      )
                                    : Chip(
                                        label: const Text(
                                          'Enrolled',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        backgroundColor: Colors.green.shade50,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 0),
                                      ),
                              ),
                            ),
                          );
                        }),
                  );
                }
              }, error: (error, stackTrace) {
                return const Center(child: const CircularProgressIndicator());
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
              // switch (studentsNotifier) {
              //   AsyncData(:final value) => Expanded(
              //       child: ListView.builder(
              //           itemCount: value.length,
              //           itemBuilder: (context, index) {
              //             print(value![index].fName);
              //             final child = value![index];

              //             return Padding(
              //               padding: const EdgeInsets.symmetric(
              //                   horizontal: 10, vertical: 5),
              //               child: Card(
              //                 elevation: 5,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15),
              //                 ),
              //                 child: ListTile(
              //                   leading: Icon(Icons.child_care,
              //                       size: 70,
              //                       color: Theme.of(context).primaryColor),
              //                   title: Text(
              //                     '${child.fName} ${child.lName}',
              //                     style: const TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 18,
              //                     ),
              //                   ),
              //                   subtitle: Padding(
              //                     padding: const EdgeInsets.only(top: 5),
              //                     child: Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           'DOB: ${child.dob.toString().split(" ")[0]}',
              //                           style: TextStyle(
              //                             color: Colors.grey[700],
              //                             fontSize: 14,
              //                           ),
              //                         ),
              //                         Text(
              //                           'Age: ${calculateMonths(child.dob)} months',
              //                           style: TextStyle(
              //                             color: Colors.grey[700],
              //                             fontSize: 14,
              //                           ),
              //                         ),
              //                         Text(
              //                           'Class: ${child.currentClass}',
              //                           style: TextStyle(
              //                             color: Colors.grey[700],
              //                             fontSize: 14,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                   trailing: child.isWaitListed
              //                       ? Chip(
              //                           label: const Text(
              //                             'Waitlisted',
              //                             style: TextStyle(color: Colors.blue),
              //                           ),
              //                           backgroundColor: Colors.blue.shade50,
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius:
              //                                 BorderRadius.circular(10),
              //                           ),
              //                           padding: const EdgeInsets.symmetric(
              //                               horizontal: 8, vertical: 0),
              //                         )
              //                       : Chip(
              //                           label: const Text(
              //                             'Enrolled',
              //                             style: TextStyle(color: Colors.green),
              //                           ),
              //                           backgroundColor: Colors.green.shade50,
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius:
              //                                 BorderRadius.circular(10),
              //                           ),
              //                           padding: const EdgeInsets.symmetric(
              //                               horizontal: 8, vertical: 0),
              //                         ),
              //                 ),
              //               ),
              //             );
              //           }),
              //     ),
              //   AsyncError(:final error) => Text(error.toString()),
              //   _ => const Center(
              //       child: CircularProgressIndicator(),
              //     )
              // }
            ],
          ),
        ),
      )),
    );
  }
}
