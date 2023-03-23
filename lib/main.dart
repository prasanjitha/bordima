import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'themes/custom_themes.dart';
import 'views/authentication/root/root.dart';
import 'views/student/favorite_boarding/get_favorite_boarding_bloc.dart';
import 'package:bordima/views/authentication/signin_page/signin_page_provider.dart';
import 'views/bordOwner/board_owner_profile_page/board_owner_profile_page_bloc.dart';
import 'views/bordOwner/bord_owner_tabbar_view/boad_owner_home_page_tabbar_view.dart';
import 'views/student/student_home_page_tabbar_page/student_home_page_tabbar_view.dart';
import 'package:bordima/views/student/student_profile_details_page/get_province/get_province_bloc.dart';
import 'package:bordima/views/student/student_profile_details_page/student_profile_details_page_bloc.dart';

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
            BlocProvider(create: (context) => GetFavoriteBoardingBloc(context)),
            BlocProvider(create: (context) => BWProfilePageBloc(context)),
            BlocProvider(
                create: (context) => StudentProDetailsPageBloc(context)),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: CustomThemes.lightTheme(context),
            home:
                snapshot.hasData && snapshot.data.toString() == 'BOARDING_OWNER'
                    ? const BordOwnerTabBarView()
                    : snapshot.hasData && snapshot.data.toString() == 'STUDENT'
                        ? const CustomerTabBarView()
                        : SignInPageProvider(),
          ),
        );
      }),
    );
  }
}
