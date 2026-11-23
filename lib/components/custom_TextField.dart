import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  CustomTextField({
    super.key,
    String? myHint,
    textcolor,
    Color? color,
    TextEditingController? txtController,
    String? hint,
    TextEditingController? textController,
  })  : hintText = myHint ?? hint ?? '',
        controller = txtController ?? textController ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}