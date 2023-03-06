import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_board_page_bloc.dart';
import 'favorite_board_page_view.dart';

class FavoriteBoardPageProvider extends BlocProvider<FavoriteBoardPageBloc> {
  FavoriteBoardPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => FavoriteBoardPageBloc(context),
          child: const FavoriteBoardPageView(),
        );
}
