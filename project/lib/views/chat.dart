import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/widget/chatscreen.dart';
import 'package:project/widget/messages.dart';
import 'package:project/widget/widget.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _homeState();
}

// FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference messages =
    FirebaseFirestore.instance.collection('messages');
TextEditingController controller = TextEditingController();
final _controller = ScrollController();

class _homeState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy("createdAt").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return messageList[index].id == email
                            ? chatscreen(
                                message: messageList[index],
                              )
                            : chatscreenforfriend(
                                message: messageList[index],
                              );
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add(
                            {
                              "message": data,
                              "createdAt": DateTime.now(),
                              'id': email,
                            },
                          );
                          controller.clear();
                          _controller.animateTo(
                            _controller.position.maxScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
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
          } else {
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 32, 65, 91),
                ),
                child: Center(
                  child: Text(""),
                ),
              ),
            );
          }
        });
  }
}
