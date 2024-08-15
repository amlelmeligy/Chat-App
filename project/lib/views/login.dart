import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/views/signUp.dart';
import 'package:project/widget/widget.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>(); //

String? email;
String? password;

class _loginState extends State<login> {
  Widget build(BuildContext context) {
    return Scaffold(
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
                onchange: (data) {
                  email = data;
                },
                controller: emailController,
                labelText: "Email",
                hintText: "Enter Your Email",
                type: TextInputType.emailAddress,
                validate: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Your Email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 32,
              ),
              defaultTextField(
                onchange: (data) {
                  password = data;
                },
                controller: passwordController,
                labelText: "Password",
                hintText: "Enter Your Password",
                type: TextInputType.name,
                validate: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Password";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 32,
              ),
              defaultButton(
                onpressed: () async {
                  // if (formKey.currentState!.validate()) {
                  //   print(emailController.text);
                  //   print(passwordController.text);
                  // }
                  var auth = FirebaseAuth.instance;
                  UserCredential user =
                      await auth.createUserWithEmailAndPassword(
                    email: email!,
                    password: password!,
                  );
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
    );
  }
}
