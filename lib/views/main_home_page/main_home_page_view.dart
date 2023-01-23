import 'package:flutter/material.dart';

class MainHomePageView extends StatefulWidget {
  const MainHomePageView({Key? key}) : super(key: key);

  @override
  _MainHomePageViewState createState() => _MainHomePageViewState();
}

class _MainHomePageViewState extends State<MainHomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(child: Text("Home Page View")),
    );
  }
}
