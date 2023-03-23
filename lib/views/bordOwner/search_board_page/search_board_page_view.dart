import 'package:bordima/themes/custom_colors.dart';
import 'package:bordima/views/bordOwner/search_board_page/search_board_page_bloc.dart';
import 'package:bordima/views/bordOwner/search_board_page/search_board_page_event.dart';
import 'package:bordima/views/bordOwner/search_board_page/search_board_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../boarding_details_page/boarding_details_page_view.dart';
import '../my_boarding_page/myBoarding_page_view.dart';

class SearchBoardPageView extends StatefulWidget {
  final String type;
  const SearchBoardPageView({required this.type, Key? key}) : super(key: key);

  @override
  _SearchBoardPageViewState createState() => _SearchBoardPageViewState();
}

class _SearchBoardPageViewState extends State<SearchBoardPageView> {
  @override
  Widget build(BuildContext context) {
    SearchBoardPageBloc bloc = BlocProvider.of<SearchBoardPageBloc>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
            leading: widget.type == 'main'
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: CustomColors.BACKGROUND,
                    ))
                : Container(
                    width: 0,
                  ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(),
              )
            ],
            backgroundColor: CustomColors.PRIMARY,
            title: TextFormField(
              onChanged: (value) {
                bloc.add(SearchBoardPlaceEvent(name: value));
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'search your boarding',
                isDense: true,
                hintStyle: Theme.of(context).textTheme.subtitle1,
                filled: true,
                fillColor: CustomColors.BACKGROUND,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(
                    color: CustomColors.SECONDARY,
                    style: BorderStyle.solid,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: CustomColors.PRIMARY, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )),
      ),
      body: BlocBuilder<SearchBoardPageBloc, SearchBoardPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state.foundBoard.isEmpty) {
            return Center(
              child: Text(
                'Start Searching',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 16.0,
                      color: CustomColors.SECONDARY,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.foundBoard.length,
            itemBuilder: (context, index) {
              return BoardingCart(
                boardName: state.foundBoard[index].boardingName,
                city: state.foundBoard[index].city,
                mobile: state.foundBoard[index].mobile,
                imgUrl: state.foundBoard[index].images[1],
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => BoardingDetailsPageView(
                            board: state.foundBoard[index],
                          )),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
