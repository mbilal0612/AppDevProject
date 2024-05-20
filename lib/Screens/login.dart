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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Email"),
                  ),
                  const SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        suffixIcon: Icon(Icons.lock)),
                  ),
                  const SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignupPage(title: "Signup");
                        }));
                      },
                      child: const Text("Signup")),

                      TextButton(
                      onPressed: () async {
                        print("Attempting login");
                        //login with google
                        User? user = await _authService.signInWithGoogle();
                        if( user != null) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                            return const HomePage(title: "Homepage");
                          }), (route)=> false);
                        }else{
                          print("There was an error");
                        }
                      },
                      child: const Text("Login with Google"))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePage(title: "Homepage");
            }));
          },
          label: const Text("Login")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
