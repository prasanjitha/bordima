import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_favorite_bord_page_bloc.dart';
import 'student_favorite_bord_page_view.dart';

class StudentFavBordPageProvider extends BlocProvider<StudentFavBordPageBloc> {
  StudentFavBordPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => StudentFavBordPageBloc(context),
          child: const StudentFavBordPageView(),
        );
}
