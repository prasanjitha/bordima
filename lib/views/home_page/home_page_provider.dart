import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_bloc.dart';
import 'home_page_view.dart';

class HomePageProvider extends BlocProvider<HomePageBloc> {
  HomePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => HomePageBloc(context),
          child: const HomePageView(),
        );
}
