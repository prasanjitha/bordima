import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_profile_details_page_bloc.dart';
import 'student_profile_details_page_view.dart';

class StudentProDetailsPageProvider
    extends BlocProvider<StudentProDetailsPageBloc> {
  StudentProDetailsPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => StudentProDetailsPageBloc(context),
          child: const StudentProDetailsPageView(),
        );
}
