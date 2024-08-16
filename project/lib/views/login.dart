import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/views/chat.dart';
import 'package:project/views/signUp.dart';
import 'package:project/widget/show-snackBar.dart';
import 'package:project/widget/widget.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

var formKey = GlobalKey<FormState>(); //

String? loginEmail;
String? loginPassword;
bool isloading = false;

class _loginState extends State<login> {
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 32, 65, 91),
          title: Text(
            'Log In',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 32, 65, 91),
          ),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset(
                  "assets/images/scholar.png",
                  alignment: Alignment.topCenter,
                  width: 150,
                  height: 120,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Scholar Chat",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: "Pacifico"),
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultTextField(
                  onchange: (value) {
                    loginEmail = value;
                  },
                  labelText: "Email",
                  hintText: "Enter Your Email",
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 32,
                ),
                defaultTextField(
                  onchange: (value) {
                    loginPassword = value;
                  },
                  labelText: "Password",
                  hintText: "Enter Your Password",
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 32,
                ),
                defaultButton(
                  onpressed: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: loginEmail!,
                          password: loginPassword!,
                        );
                        Navigator.pushNamed(context, 'chat');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ShowBar(context, "No user found for that email.");
                        } else if (e.code == 'wrong-password') {
                          ShowBar(context,
                              "Wrong password provided for that user.");
                        }
                      } catch (e) {
                        ShowBar(context, "An error occurred");
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                  text: "Log In",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "signUp");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 200, 221, 236),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
