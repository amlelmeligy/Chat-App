import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/widget/chatscreen.dart';
import 'package:project/widget/widget.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _homeState();
}

class _homeState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 65, 91),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/scholar.png",
              width: 50,
              height: 50,
            ),
            Text(
              'Chat',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return chatscreen();
              },
            ),
          ),
          Container(
              padding: EdgeInsets.all(15),
              // color: Colors.grey,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Send Message",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    color: Color.fromARGB(255, 32, 65, 91),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 32, 65, 91),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
