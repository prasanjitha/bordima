import 'package:flutter/material.dart';

import '../../../themes/custom_colors.dart';
import '../search_page/search_page_provider.dart';
import '../favorite_board_page/favorite_board_page_provider.dart';
import '../student_profile_details_page/student_profile_details_page_provider.dart';
import 'package:bordima/views/student/student_main_home_page/student_main_home_page_provider.dart';

class CustomerTabBarView extends StatefulWidget {
  const CustomerTabBarView({Key? key}) : super(key: key);

  @override
  _CustomerTabBarViewState createState() => _CustomerTabBarViewState();
}

class _CustomerTabBarViewState extends State<CustomerTabBarView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    StudentMainHomePageProvider(),
    FavoriteBoardPageProvider(),
    SearchPageProvider(),
    StudentProDetailsPageProvider(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 70.0,
        child: BottomNavigationBar(
          backgroundColor: CustomColors.SCAFFOLD,
          selectedItemColor: CustomColors.PRIMARY,
          selectedFontSize: 16.0,
          unselectedLabelStyle:
              const TextStyle(fontSize: 16.0, color: CustomColors.SECONDARY),
          elevation: 15,
          onTap: onTabTapped,
          unselectedIconTheme: const IconThemeData(
            color: CustomColors.SECONDARY,
          ),
          unselectedItemColor: CustomColors.SECONDARY,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_rounded,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.manage_accounts_outlined,
              ),
              label: 'My Account',
            ),
          ],
        ),
      ),
    );
  }
}
