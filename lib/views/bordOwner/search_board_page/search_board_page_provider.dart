import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_board_page_bloc.dart';
import 'search_board_page_view.dart';

class SearchBoardPageProvider extends BlocProvider<SearchBoardPageBloc> {
  final String type;
  SearchBoardPageProvider({required this.type, Key? key})
      : super(
          key: key,
          create: (context) => SearchBoardPageBloc(context),
          child: SearchBoardPageView(type: type),
        );
}
