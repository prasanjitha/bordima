import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bording_details_page_bloc.dart';
import 'bording_details_page_view.dart';

class BordingDetailsPageProvider extends BlocProvider<BordingDetailsPageBloc> {
  BordingDetailsPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => BordingDetailsPageBloc(context),
          child: const BordingDetailsPageView(),
        );
}
