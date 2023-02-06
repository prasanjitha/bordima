import 'dart:developer';

import 'package:bordima/views/authentication/signin_page/signin_page_provider.dart';
import 'package:bordima/views/bordOwner/add_boarding_page/add_boarding_page_provider.dart';
import 'package:bordima/views/bordOwner/board_owner_home_page/board_owner_home_page_provider.dart';
import 'package:bordima/views/onboarding_pages/main_ob_page.dart';
import 'package:bordima/views/student/student_main_home_page/student_main_home_page_provider.dart';
import 'package:bordima/views/student/student_profile_details_page/get_province/get_province_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'themes/custom_themes.dart';
import 'views/authentication/forgot_password_page/check_email_page.dart';
import 'views/authentication/forgot_password_page/forgot_password_page_view.dart';
import 'views/authentication/role_select_page/role_select_page_view.dart';
import 'views/authentication/root/root.dart';
import 'views/authentication/signin_page/signin_page_view.dart';
import 'views/authentication/signup_page/signup_page_view.dart';
import 'views/bordOwner/add_boarding_page/add_boarding_page_view.dart';
import 'views/bordOwner/bord_owner_tabbar_view/boad_owner_home_page_tabbar_view.dart';
import 'views/student/student_home_page_tabbar_page/student_home_page_tabbar_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLoggedUser(),
      builder: ((context, snapshot) {
        log(snapshot.data.toString());
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetProvinceBloc(context)),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: CustomThemes.lightTheme(context),
            home:
                snapshot.hasData && snapshot.data.toString() == 'BOARDING_OWNER'
                    ? SignInPageProvider()
                    : snapshot.hasData
                        ? SignInPageProvider()
                        : SignInPageProvider(),
          ),
        );
      }),
    );
  }
}
