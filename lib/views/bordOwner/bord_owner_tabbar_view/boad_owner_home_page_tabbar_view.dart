import 'package:bordima/views/bordOwner/board_owner_home_page/board_owner_home_page_provider.dart';
import 'package:bordima/views/bordOwner/my_boarding_page/myBoarding_page_provider.dart';
import 'package:flutter/material.dart';

import '../../../themes/custom_colors.dart';
import '../add_boarding_page/add_boarding_page_provider.dart';
import '../board_owner_profile_page/board_owner_profile_page_provider.dart';
import '../search_board_page/search_board_page_provider.dart';

class BordOwnerTabBarView extends StatefulWidget {
  const BordOwnerTabBarView({Key? key}) : super(key: key);

  @override
  _BordOwnerTabBarViewState createState() => _BordOwnerTabBarViewState();
}

class _BordOwnerTabBarViewState extends State<BordOwnerTabBarView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    BDOwnerHomePageProvider(),
    MyBoardingPageProvider(),
    SearchBoardPageProvider(
      type: 'tab',
    ),
    BWProfilePageProvider(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => AddBoardingPageProvider()),
                ),
              );
            },
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                shape: BoxShape.circle,
                color: CustomColors.PRIMARY,
              ),
              child: const Icon(Icons.add, size: 40),
            ),
          ),
        ),
      ),
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
                Icons.feedback_outlined,
              ),
              label: 'Feedback',
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
