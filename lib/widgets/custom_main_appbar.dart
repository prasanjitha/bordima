import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback tap;
  const CustomAppBar({
    required this.tap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: InkWell(
            onTap: tap,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
        ),
        title: Image.asset('assets/images/Logo.png'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
