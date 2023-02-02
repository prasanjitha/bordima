import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_boarding_page_bloc.dart';
import 'add_boarding_page_view.dart';

class AddBoardingPageProvider extends BlocProvider<AddBoardingPageBloc> {
  AddBoardingPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => AddBoardingPageBloc(context),
          child: const AddBoardingPageView(),
        );
}
