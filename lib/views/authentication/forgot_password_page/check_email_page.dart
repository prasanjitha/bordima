import 'package:bordima/views/authentication/signin_page/signin_page_provider.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_main_appbar.dart';
import '../../../widgets/custom_main_button.dart';

class CheckEmailPage extends StatefulWidget {
  CheckEmailPage({Key? key}) : super(key: key);

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: '',
          tap: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 60.0,
            ),
            Image.asset('assets/images/email_b.png'),
            Text(
              'Check your email',
              style: Theme.of(context).textTheme.headline2!.copyWith(),
            ),
            Text(
              'We’ve sent instructions on how to reset The password (also check the Spam folder).',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 14,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomMainButton(
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => SignInPageProvider()),
                    ),
                  );
                },
                btnText: 'Go Back'),
          ],
        ),
      ),
    );
  }
}
