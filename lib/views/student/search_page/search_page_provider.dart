import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_page_bloc.dart';
import 'search_page_view.dart';

class SearchPageProvider extends BlocProvider<SearchPageBloc> {
  SearchPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => SearchPageBloc(context),
          child: const SearchPageView(),
        );
}
