import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/firebase_options.dart';
import 'package:project/views/chat.dart';
import 'package:project/views/login.dart';
import 'package:project/views/openningScreen.dart';
import 'package:project/views/signUp.dart';
import 'package:lottie/lottie.dart';

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
        'chat': (context) => chat(),
        'SplashScreen': (context) => SplashScreen(),
        'OpenningScreen': (context) => OpenningScreen()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "SplashScreen",
    );
  }
}

////////////////////
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OpenningScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 32, 65, 91),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
            ),
            Lottie.asset("assets/lotties/chat.json")
            // Image.asset(
            //   'assets/lotties/splash_screen.json',
            //   width: double.infinity,
            //   height: 810,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 350),
            //   child: Center(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Center(
            //           child: Text(
            //             "Notes",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               fontSize: 80,
            //               color: Colors.white,
            //               fontFamily: "DancingScript",
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            ,
            // SizedBox(
            //     height:
            //         20), // add some space between the image and the progress indicator
            // Center(
            //   child: CircularProgressIndicator(
            //     valueColor: AlwaysStoppedAnimation(Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
