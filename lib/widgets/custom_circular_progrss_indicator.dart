import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Widget body;
  const CustomCircularProgressIndicator({Key? key, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        body,
        Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
            color: Colors.white54,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors.BACKGROUND,
                borderRadius: BorderRadius.circular(10.0)),
            width: width * 0.8,
            height: 200.0,
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator.adaptive(
                      value: null,
                      strokeWidth: 4.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Text(
                      "Please wait Please wait google map",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
