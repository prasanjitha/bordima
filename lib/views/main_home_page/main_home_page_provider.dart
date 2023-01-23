import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_home_page_bloc.dart';
import 'main_home_page_view.dart';

class MainHomePageProvider extends BlocProvider<MainHomePageBloc> {
  MainHomePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => MainHomePageBloc(context),
          child: const MainHomePageView(),
        );
}
