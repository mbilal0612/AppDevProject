import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:project/screens/home.dart";
import "package:project/screens/signup.dart";
import "package:project/service/auth_service.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();

  bool _hidden = true;

  void loginGoogle() async {
    print("Attempting login");
    //login with google
    User? user = await _authService.signInWithGoogle();
    if (user != null) {
      //to make sure that the widget is mounted when we switch contexts
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const HomePage(title: "Homepage");
      }), (route) => false);
    } else {
      print("There was an error: user == null");
    }
  }

  void loginEmail(email, password) async {
    print("Attempting login");
    //login with google
    User? user = await _authService.loginWithEmail(email, password);
    if (user != null) {
      //to make sure that the widget is mounted when we switch contexts
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const HomePage(title: "Homepage");
      }), (route) => false);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to login')));
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
                    const Text("Don't Have an Account?  "),
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
                OutlinedButton(
                    onPressed: () => loginEmail(emailController.text.trim(),
                        emailController.text.trim()),
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: const Color(0xFF587CF4)),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),

                // login with Google button
                OutlinedButton(
                    onPressed: loginGoogle,
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: const Color(0xFF587CF4)),
                    child: const Center(
                      child: Text(
                        "Login with Google",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),

                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ),
                    Text("  or  "),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),

                //Signup Button
                // OutlinedButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return const Signup(title: "Signup");
                //       }));
                //     },
                //     style: OutlinedButton.styleFrom(
                //         side: const BorderSide(color: Color(0xFF587CF4)),
                //         shape: const RoundedRectangleBorder(),
                //         backgroundColor: Colors.white),
                //     child: const Center(
                //       child: Text(
                //         "Sign up",
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
