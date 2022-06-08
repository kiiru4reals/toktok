import 'package:flutter/material.dart';
import 'package:toktok/core/utils/color_utils.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;
  const TextInputField({Key? key, required this.controller, required this.labelText, required this.isObscure, required this.icon}) : super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override

  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(widget.labelText),
        prefixIcon: Icon(widget.icon),
        labelStyle: const TextStyle(
          fontSize: 20
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor),
        ),
      ),
      controller: widget.controller,
      obscureText: widget.isObscure,
    );
  }
}
