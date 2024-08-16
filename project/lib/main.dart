import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/firebase_options.dart';
import 'package:project/views/home.dart';
import 'package:project/views/login.dart';
import 'package:project/views/signUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        'home': (context) => home(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
    );
  }
}
