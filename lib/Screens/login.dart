import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:project/commons/role.dart";
import "package:project/screens/home.dart";
import "package:project/screens/parentView/parent_home.dart";
import "package:project/screens/signup.dart";
import "package:project/service/auth_service.dart";
import "package:project/service/role_service.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final RoleService _roleService = RoleService();

  bool _hidden = true;
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void loginGoogle() async {
    print("Attempting login");
    //login with google
    User? user = await _authService.signInWithGoogle();
    if (user != null) {
      //to make sure that the widget is mounted when we switch contexts
      //add user to user Roles with admin rights
      // String role = await _roleService.checkUserRole(user.email!);
      // if (role == "") {
      // _roleService.addUserRole(user.email!, Role.admin);
      // } else if (role == "admin") {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const HomePage();
      }), (route) => false);
      // } else if (role == "parent") {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return ParentHome(parentEmail: user.email!);
      }), (route) => false);
      // }
    } else {
      print("There was an error: user == null");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Error Logging in ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  void loginEmail(email, password) async {
    print("Attempting login");
    //login with google
    User? user = await _authService.loginWithEmail(email, password);
    if (user != null) {
      //to make sure that the widget is mounted when we switch contexts
      // var role = _roleService.checkUserRole(user.email!);
      // if (role == "") {
      // _roleService.addUserRole(user.email!, Role.admin);
      // } else if (role == "admin") {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const HomePage();
      }), (route) => false);
      // } else if (role == "parent") {
      // Navigator.pushAndRemoveUntil(context,
      //     MaterialPageRoute(builder: (context) {
      //   return ParentHome(parentEmail: user.email!);
      // }), (route) => false);
      // }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to login')));
      print("There was an error");
    }
  }

  @override
  Widget build(BuildContext context) {
    passwordController.text = "";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(
                          "Login ",
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
                      color: Colors.blue,
                      height: 2,
                      thickness: 2,
                      indent: 10,
                      endIndent: 315,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Email Field
                  //perfected the input fields
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: emailController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        focusColor: Color(0xFF898989),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF898989)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF898989)),
                        ),
                        labelText: "Email",
                        floatingLabelStyle: TextStyle(
                          color: Color(0xFF898989),
                        ),
                      ),
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
                  ),

                  //password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        return null;
                      },
                      controller: passwordController,
                      obscureText: _hidden,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidden = !_hidden;
                                passwordController.text =
                                    passwordController.text ?? "";
                              });
                            },
                            icon: _hidden
                                ? const Icon(Icons.lock)
                                : const Icon(Icons.lock_open_rounded)),
                        focusColor: const Color(0xFF898989),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF898989))),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF898989))),
                        labelText: "Password",
                        floatingLabelStyle: const TextStyle(
                          color: Color(0xFF898989),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Don't Have an Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Signup(title: "Signup");
                            }));
                          },
                          child: const Text(
                            "Sign up",
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginEmail(
                          emailController.text.trim(),
                          emailController.text.trim(),
                        );
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
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // const Padding(
                  //   padding: EdgeInsets.all(16.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Divider(
                  //           color: Colors.grey,
                  //           thickness: 1.0,
                  //         ),
                  //       ),
                  //       Text("  or  "),
                  //       Expanded(
                  //         child: Divider(
                  //           color: Colors.grey,
                  //           thickness: 1.0,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // // login with Google button
                  // ElevatedButton(
                  //     onPressed: loginGoogle,
                  //     style: ElevatedButton.styleFrom(
                  //         shape: const RoundedRectangleBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(10.0))),
                  //         backgroundColor: const Color(0xFF007AFF)),
                  //     child: const Center(
                  //       child: Text(
                  //         "Login with Google",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
