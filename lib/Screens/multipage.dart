import 'package:flutter/material.dart';

class Multipage extends StatefulWidget {
  const Multipage({super.key});

  @override
  State<Multipage> createState() => _MultipageState();
}

class _MultipageState extends State<Multipage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Stepper(steps: [
          Step(
              title: const Text('Step 1'),
              content: const Text('Information  2'))
        ]),
      ),
    ));
  }
}
