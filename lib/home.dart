import 'package:flutter/material.dart';
import 'package:project/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LoginPage(title: "Homepage");
            }));
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
