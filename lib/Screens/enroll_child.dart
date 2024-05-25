import 'package:flutter/material.dart';
import 'package:project/Screens/add_to_classroom.dart';

class EnrollChild extends StatelessWidget {
  const EnrollChild({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign-In'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: "First Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Last Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputDatePickerFormField(
                    firstDate: DateTime(2000), lastDate: DateTime.now()),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      //if child enrolled succesfully, move to enrol child to class page
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return Addtoclassroom();
                      }), (route) => false);
                    },
                    child: const Text("Add Child"))
              ],
            ),
          ),
        )));

    // return SafeArea(
    //     child: Scaffold(
    //   body: Column(children: [
    //     const Text(
    //       "Sign In",
    //       style: TextStyle(
    //           fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w600),
    //     ),
    //     const Divider(
    //       thickness: 2.0,
    //       indent: 100.0,
    //       endIndent: 14.0,
    //       color: Colors.blue,
    //     ),
    //     TextButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //         Navigator.push(context, MaterialPageRoute(builder: (context) {
    //           return const LoginPage(title: "Login");
    //         }));
    //       },
    //       child: const Text('Go Back'),
    //     )
    //   ]),
    // ));
  }
}
