import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

GlobalKey<FormState> formKey = GlobalKey(); //

String? email;
String? password;
bool isloading = false;
bool isPassword = true;

class _loginState extends State<login> {
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
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
                Lottie.asset(
                  "assets/lotties/44444.json",
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
                        fontFamily: "Poppins"),
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultTextField(
                  onchange: (data) {
                    email = data;
                  },
                  labelText: "Email",
                  hintText: "Enter Your Email",
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 32,
                ),
                defaultTextField(
                  suffix: //العين
                      isPassword ? Icons.visibility_off : Icons.visibility,
                  isPassword: isPassword,
                  onchange: (data) {
                    password = data;
                  },
                  labelText: "Password",
                  hintText: "Enter Your Password",
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 32,
                ),
                defaultButton(
                  text: "Log In",
                  onpressed: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});

                      try {
                        await loginuser();
                        Navigator.pushNamed(context, 'chat', arguments: email);
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

  Future<void> loginuser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
