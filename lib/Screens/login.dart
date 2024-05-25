import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:project/Screens/home.dart";
import "package:project/Screens/signup.dart";
import "package:project/service/auth_service.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();

  void loginGoogle() async {
    print("Attempting login");
    //login with google
    User? user = await _authService.signInWithGoogle();
    if (user != null) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const HomePage(title: "Homepage");
      }), (route) => false);
    } else {
      print("There was an error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
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

                  //perfected the input fields
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
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
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Password",
                        suffixIcon: Icon(Icons.lock)),
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
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomePage(title: "Homepage");
                        }));
                      },
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: const Color(0xFF587CF4)),
                      child: const Center(
                        child: Text(
                          "Login",
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
                      Text ("  or  ")
                      ,
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),

                  //Signup Button
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignupPage(title: "Signup");
                        }));
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF587CF4) ),
                          shape: const RoundedRectangleBorder(
                            
                          ),
                          
                          backgroundColor: Colors.white),
                      child: const Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(color:  Color(0xFF587CF4)),
                        ),
                      )),

                  TextButton(
                      onPressed: loginGoogle,
                      child: const Text("Login with Google"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
