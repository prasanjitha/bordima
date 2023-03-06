import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_boarding_details_page_bloc.dart';
import 'student_boarding_details_page_view.dart';

class StudentBoardingDetailsPageProvider
    extends BlocProvider<StudentBoardingDetailsPageBloc> {
  StudentBoardingDetailsPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => StudentBoardingDetailsPageBloc(context),
          // child: const StudentBoardingDetailsPageView(),
        );
}
