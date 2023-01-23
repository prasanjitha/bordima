import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_page_bloc.dart';
import 'forgot_password_page_view.dart';

class ForgotPasswordPageProvider extends BlocProvider<ForgotPasswordPageBloc> {
  ForgotPasswordPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => ForgotPasswordPageBloc(context),
          child: const ForgotPasswordPageView(),
        );
}
