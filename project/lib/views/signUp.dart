import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/views/login.dart';
import 'package:project/widget/show-snackBar.dart';
import 'package:project/widget/widget.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

var formKey = GlobalKey<FormState>(); //

String? email;
String? password;
bool isloading = false;
bool isPassword = true;

class _signUpState extends State<signUp> {
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
            'Sign Up',
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
                  "Sign Up",
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
                  height: 15,
                ),
                defaultTextField(
                  isPassword: isPassword,
                  suffix: //العين
                      isPassword ? Icons.visibility_off : Icons.visibility,
                  onchange: (data) {
                    password = data;
                  },
                  labelText: "Password",
                  hintText: "Enter Your Password",
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 15,
                ),
                defaultTextField(
                  isPassword: isPassword,
                  suffix: //العين
                      isPassword ? Icons.visibility_off : Icons.visibility,
                  onchange: (data) {
                    password = data;
                  },
                  labelText: "Confirm Password",
                  hintText: "Enter Your Password",
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 32,
                ),
                defaultButton(
                  text: "Sign Up",
                  onpressed: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await signupuser();
                        Navigator.pushNamed(context, 'chat');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'badly formatted') {
                          ShowBar(
                              context, "The password provided is too weak.");
                        } else if (e.code == 'email-already-in-use') {
                          ShowBar(context,
                              "The account already exists for that email.");
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
                      "Already have an account ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color.fromARGB(255, 200, 221, 236),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signupuser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
