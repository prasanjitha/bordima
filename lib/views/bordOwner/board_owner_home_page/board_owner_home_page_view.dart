import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../themes/custom_colors.dart';
import '../../authentication/signin_page/signin_page_provider.dart';

class BDOwnerHomePageView extends StatefulWidget {
  const BDOwnerHomePageView({Key? key}) : super(key: key);

  @override
  _BDOwnerHomePageViewState createState() => _BDOwnerHomePageViewState();
}

class _BDOwnerHomePageViewState extends State<BDOwnerHomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: IconButton(
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            await auth.signOut();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => SignInPageProvider()),
              ),
            );
          },
          icon: const Icon(
            Icons.logout,
            color: CustomColors.PRIMARY,
          ),
        ),
      ),
    );
  }
}
