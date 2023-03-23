import 'package:flutter/material.dart';

class CustomLineTextField extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  const CustomLineTextField({
    required this.title,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: title,
        contentPadding: const EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
