import 'package:bordima/views/onboarding_pages/main_ob_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'themes/custom_themes.dart';
import 'views/authentication/forgot_password_page/check_email_page.dart';
import 'views/authentication/forgot_password_page/forgot_password_page_view.dart';
import 'views/authentication/role_select_page/role_select_page_view.dart';
import 'views/authentication/signin_page/signin_page_view.dart';
import 'views/authentication/signup_page/signup_page_view.dart';
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
    return MaterialApp(
        title: 'Flutter Demo',
        theme: CustomThemes.lightTheme(context),
        home: CustomerTabBarView());
  }
}
