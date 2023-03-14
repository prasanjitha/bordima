import 'package:flutter/material.dart';

import '../../../themes/custom_colors.dart';

class FavoriteBoardPageView extends StatefulWidget {
  const FavoriteBoardPageView({Key? key}) : super(key: key);

  @override
  _FavoriteBoardPageViewState createState() => _FavoriteBoardPageViewState();
}

class _FavoriteBoardPageViewState extends State<FavoriteBoardPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.PRIMARY,
        title: const Text("My Favorites"),
        centerTitle: true,
      ),
      body: const Center(
          child: Text("Home Page View with boarding owner new changes for apis change")),
    );
  }
}
