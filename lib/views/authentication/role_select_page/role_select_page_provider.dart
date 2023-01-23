import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'role_select_page_bloc.dart';
import 'role_select_page_view.dart';

class RoleSelectPageProvider extends BlocProvider<RoleSelectPageBloc> {
  RoleSelectPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => RoleSelectPageBloc(context),
          child: const RoleSelectPageView(),
        );
}
