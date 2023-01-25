import 'package:bordima/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_main_appbar.dart';
import '../signup_page/signup_page_provider.dart';

class RoleSelectPageView extends StatefulWidget {
  const RoleSelectPageView({Key? key}) : super(key: key);

  @override
  _RoleSelectPageViewState createState() => _RoleSelectPageViewState();
}

class _RoleSelectPageViewState extends State<RoleSelectPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Sign In',
          tap: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Who are you ?',
                style: Theme.of(context).textTheme.headline2!.copyWith(),
              ),
              Image.asset(
                'assets/images/undraw_details.png',
              ),
              Column(
                children: [
                  CustomMainButton(
                      tap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => SignUpPageProvider(
                                  role: 'STUDENT',
                                )),
                          ),
                        );
                      },
                      btnText: 'Student'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomMainButton(
                      tap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => SignUpPageProvider(
                                  role: 'BOARDING_OWNER',
                                )),
                          ),
                        );
                      },
                      btnText: 'Boarding owner'),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
