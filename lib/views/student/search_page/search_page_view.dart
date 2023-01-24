import 'package:bordima/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          color: CustomColors.PRIMARY,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search your boarding',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  filled: true,
                  fillColor: CustomColors.BACKGROUND,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.BACKGROUND,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(child: Text("Start searching...")),
    );
  }
}
