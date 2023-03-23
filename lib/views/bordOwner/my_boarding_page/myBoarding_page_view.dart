import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'myBoarding_page_bloc.dart';
import '../../../themes/custom_colors.dart';
import '../boarding_details_page/boarding_details_page_view.dart';
import 'package:bordima/views/bordOwner/my_boarding_page/myBoarding_page_state.dart';

class MyBoardingPageView extends StatefulWidget {
  const MyBoardingPageView({Key? key}) : super(key: key);

  @override
  _MyBoardingPageViewState createState() => _MyBoardingPageViewState();
}

class _MyBoardingPageViewState extends State<MyBoardingPageView> {
  @override
  Widget build(BuildContext context) {
    MyBoardingPageBloc bloc = BlocProvider.of<MyBoardingPageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.PRIMARY,
        title: const Text("My Boarding"),
        centerTitle: true,
      ),
      body: BlocBuilder<MyBoardingPageBloc, MyBoardingPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
            itemCount: state.myBoards.length,
            itemBuilder: (context, index) {
              return BoardingCart(
                boardName: state.myBoards[index].boardingName,
                city: state.myBoards[index].city,
                mobile: state.myBoards[index].mobile,
                imgUrl: state.myBoards[index].images[1],
                tap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => BoardingDetailsPageView(
                            board: state.myBoards[index],
                          ))));
                },
              );
            },
          );
        },
      ),
    );
  }
}

class BoardingCart extends StatelessWidget {
  final String boardName;
  final String city;
  final String mobile;
  final String imgUrl;
  final VoidCallback tap;
  const BoardingCart({
    Key? key,
    required this.boardName,
    required this.city,
    required this.imgUrl,
    required this.mobile,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: CustomColors.PRIMARY,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
              child: Image.network(
                imgUrl,
                height: 150.0,
                width: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    boardName,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 18.0,
                          color: CustomColors.SURFACED,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  city,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 16.0,
                        color: CustomColors.SECONDARY,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  mobile,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 16.0,
                        color: CustomColors.SECONDARY,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: tap,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: CustomColors.PRIMARY,
                    ),
                    child: Center(
                      child: Text(
                        'Details',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 16.0,
                              color: CustomColors.BACKGROUND,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
