import 'package:flutter/material.dart';

class MyBoardingPageView extends StatefulWidget {
  const MyBoardingPageView({Key? key}) : super(key: key);

  @override
  _MyBoardingPageViewState createState() => _MyBoardingPageViewState();
}

class _MyBoardingPageViewState extends State<MyBoardingPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyBoarding"),
      ),
      body: const Center(child: Text("Home Page View")),
    );
  }
}
