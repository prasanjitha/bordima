import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'boarding_details_page_bloc.dart';
import 'boarding_details_page_view.dart';

class BoardingDetailsPageProvider
    extends BlocProvider<BoardingDetailsPageBloc> {
  BoardingDetailsPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => BoardingDetailsPageBloc(context),
          // child: const BoardingDetailsPageView(),
        );
}
