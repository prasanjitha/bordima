import 'package:flutter/material.dart';

class CustomLineInputField extends StatelessWidget {
  final String lable;
  final String hintText;
  final int maxLength;
  final bool enabled;
  final TextEditingController textEditingController;
  const CustomLineInputField({
    required this.hintText,
    required this.lable,
    required this.textEditingController,
    this.maxLength = 15,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: enabled,
          controller: textEditingController,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
