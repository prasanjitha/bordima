import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board_owner_home_page_bloc.dart';
import 'board_owner_home_page_view.dart';

class BDOwnerHomePageProvider extends BlocProvider<BDOwnerHomePageBloc> {
  BDOwnerHomePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => BDOwnerHomePageBloc(context),
          child: const BDOwnerHomePageView(),
        );
}
