import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board_owner_profile_page_bloc.dart';
import 'board_owner_profile_page_view.dart';

class BWProfilePageProvider extends BlocProvider<BWProfilePageBloc> {
  BWProfilePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => BWProfilePageBloc(context),
          child: const BWProfilePageView(),
        );
}
