import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget defaultTextField({
  required String labelText,
  required String hintText,
  required TextInputType type,
  String? Function(String?)? onchange,
}) =>
    TextFormField(
      onChanged: onchange,
      cursorColor: Colors.white,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        } else {
          return null;
        }
      },
      keyboardType: type,
      decoration: InputDecoration(
        hoverColor: Colors.white,
        focusColor: Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
      ),
    );

///////////////////////////////
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.white,
  double raduis = 10,
  required onpressed,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
      width: width,
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            color: Color.fromARGB(255, 32, 65, 91),
            fontSize: 18,
          ),
        ),
      ),
    );
