import 'package:flutter/material.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';

class InputField extends StatelessWidget {
  String name;
  bool isVisible;
  TextEditingController con;

  InputField(
      {super.key, required this.name, required this.con, required this.isVisible});

  String? fun(String? v) {
    if (v == null || v
        .trim()
        .isEmpty || v.length < 2) {
      return "Enter a Valid Input";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isVisible ? true : false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          filled: true,
          suffixIcon: isVisible == false
              ? Icon(Icons.remove_red_eye, color: grey,)
              : SizedBox(),

          hint: Text("$name", style: TextStyle(color: grey),)
      ),
      cursorColor: grey,
      controller: con,
      validator: fun,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

}