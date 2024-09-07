import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/widget/widget.dart';

class OpenningScreen extends StatelessWidget {
  const OpenningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF20415B),
        child: ListView(
          children: [
            Lottie.asset("assets/lotties/chat4.json"),
            SizedBox(height: 40),
            Text(
              "Chat with your friends, \n share photo and video files \n fast with high quality",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                color: Colors.white,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(20),
              child: defaultButton(
                  onpressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  text: "Let's Start"),
            )
          ],
        ),
      ),
    );
  }
}
