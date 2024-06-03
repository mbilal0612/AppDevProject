import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/commons/role.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/login.dart';

import 'package:project/service/auth_service.dart';
import 'package:project/service/role_service.dart';

class Signup extends StatefulWidget {
  const Signup({super.key, required this.title});

  final String title;

  @override
  State<Signup> createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  bool _hidden = true;
  final AuthService _authService = AuthService();
  final RoleService _roleService = RoleService();

  void registerEmail(email, password) async {
    print("Attempting register");
    //login with google
    User? user = await _authService.registerWithEmail(email, password);
    if (user != null) {
      //to make sure that the widget is mounted when we switch contexts
      bool roleAdded = await _roleService.addUserRole(user.email, Role.admin);
      //check if role added was successful
      if (!roleAdded) {
        _authService.deleteEmail(user);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to register: User Role not assigned')));
        print("There was an error");
      } else {
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        }), (route) => false);
      }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to register')));
      print("There was an error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        "Register ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Divider(
                    color: Colors.blue, // Optional: specify color
                    height: 2, // Optional: specify height
                    thickness: 2, // Optional: specify thickness
                    indent: 10, // Optional: specify indent (left padding)
                    endIndent:
                        315, // Optional: specify endIndent (right padding)
                  ),
                ),

                //Email Field
                //perfected the input fields
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: const InputDecoration(
                        focusColor: Color(0xFF898989),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF898989))),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF898989))),
                        labelText: "Email",
                        floatingLabelStyle: TextStyle(
                          color: Color(0xFF898989),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 100,
                  height: 20,
                ),

                //password textfield
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: _hidden,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.lock)),
                        focusColor: const Color(0xFF898989),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF898989))),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF898989))),
                        labelText: "Password",
                        floatingLabelStyle: const TextStyle(
                          color: Color(0xFF898989),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                const SizedBox(
                  width: 100,
                  height: 20,
                ),

                //Login Button
                ElevatedButton(
                    onPressed: () => registerEmail(emailController.text.trim(),
                        emailController.text.trim()),
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      backgroundColor: const Color(0xFF007AFF),
                    ),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),

                // const Row(
                //   children: [
                //     Expanded(
                //       child: Divider(
                //         color: Colors.grey,
                //         thickness: 1.0,
                //       ),
                //     ),
                //     Text("  or  "),
                //     Expanded(
                //       child: Divider(
                //         color: Colors.grey,
                //         thickness: 1.0,
                //       ),
                //     ),
                //   ],
                // ),

                // //Signup Button
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return const LoginPage();
                //       }));
                //     },
                //     style: OutlinedButton.styleFrom(
                //         side: const BorderSide(color: Color(0xFF007AFF)),
                //         shape: const RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //         ),
                //         backgroundColor: Colors.white),
                //     child: const Center(
                //       child: Text(
                //         "Login",
                //         style: TextStyle(color: Color(0xFF587CF4)),
                //       ),
                //     )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
