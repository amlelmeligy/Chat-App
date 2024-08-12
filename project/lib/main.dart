import 'package:flutter/material.dart';
import 'package:project/views/login.dart';
import 'package:project/views/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login': (context) => login(),
        'signUp': (context) => signUp(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
    );
  }
}
