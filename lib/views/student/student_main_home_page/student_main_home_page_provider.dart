import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_main_home_page_bloc.dart';
import 'student_main_home_page_view.dart';

class StudentMainHomePageProvider
    extends BlocProvider<StudentMainHomePageBloc> {
  StudentMainHomePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => StudentMainHomePageBloc(context),
          child: const StudentMainHomePageView(),
        );
}
