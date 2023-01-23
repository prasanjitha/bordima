import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback tap;
  final String btnText;
  const CustomTextButton({
    Key? key,
    required this.tap,
    required this.btnText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: tap,
      child: Container(
        width: width,
        height: 46.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: CustomColors.BACKGROUND,
        ),
        child: Center(
          child: Text(
            btnText,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 16,
                  color: CustomColors.SECONDARY,
                ),
          ),
        ),
      ),
    );
  }
}
