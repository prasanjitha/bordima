import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'myBoarding_page_bloc.dart';
import 'myBoarding_page_view.dart';

class MyBoardingPageProvider extends BlocProvider<MyBoardingPageBloc> {
  MyBoardingPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => MyBoardingPageBloc(context),
          child: const MyBoardingPageView(),
        );
}
