import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/boarding.dart';
import 'student_boarding_details_page_bloc.dart';
import 'student_boarding_details_page_view.dart';

class StudentBoardingDetailsPageProvider
    extends BlocProvider<StudentBoardingDetailsPageBloc> {
  final BoardModel board;
  StudentBoardingDetailsPageProvider({required this.board, Key? key})
      : super(
          key: key,
          create: (context) => StudentBoardingDetailsPageBloc(context, board),
          child: StudentBoardingDetailsPageView(
            board: board,
          ),
        );
}
