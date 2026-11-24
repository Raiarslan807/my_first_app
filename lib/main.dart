
import 'package:flutter/material.dart';
import 'signin.dart';

void main() {
  runApp(const UniLibrary());
}

class UniLibrary extends StatelessWidget {
  const UniLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniLibrary - YOUR ROLL NO',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: false,
      ),
      home: const SignIn(),
    );
  }
}
