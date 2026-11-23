
import 'package:flutter/material.dart';
import 'package:my_first_app/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Log In',

      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: false,
      ),

      home: LogIn(),
    );
  }
}
