import 'package:bordima/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class StudentFavBordPageView extends StatefulWidget {
  const StudentFavBordPageView({Key? key}) : super(key: key);

  @override
  _StudentFavBordPageViewState createState() => _StudentFavBordPageViewState();
}

class _StudentFavBordPageViewState extends State<StudentFavBordPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.PRIMARY,
        title: const Text("Favorite"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Add your favorite places")),
    );
  }
}
