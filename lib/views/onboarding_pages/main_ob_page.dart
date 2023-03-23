import 'package:flutter/material.dart';

import '../../widgets/custom_main_button.dart';
import 'package:bordima/widgets/custom_text_button.dart';
import '../authentication/signin_page/signin_page_provider.dart';
import 'package:bordima/views/authentication/role_select_page/role_select_page_provider.dart';

class MainOBScreen extends StatelessWidget {
  const MainOBScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 1.0,
            ),
            Image.asset('assets/images/Logo.png'),
            Image.asset('assets/images/image.png'),
            Text(
              'Welcome to bordima',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Craving for your favourite food? Takeaway will deliver it, wherever you are!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 14,
                  ),
            ),
            CustomMainButton(
              tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SignInPageProvider()),
                  ),
                );
              },
              btnText: 'Sign In',
            ),
            CustomTextButton(
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => RoleSelectPageProvider()),
                    ),
                  );
                },
                btnText: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
