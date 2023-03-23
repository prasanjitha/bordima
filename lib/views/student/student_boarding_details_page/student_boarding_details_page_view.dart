// ignore_for_file: use_build_context_synchronously

import 'package:bordima/models/boarding.dart';
import 'package:bordima/views/student/student_boarding_details_page/student_boarding_details_page_event.dart';
import 'package:bordima/views/student/student_boarding_details_page/student_boarding_details_page_state.dart';
import 'package:bordima/widgets/custom_main_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../themes/custom_colors.dart';
import '../../../widgets/popup_window_button.dart';
import '../favorite_boarding/get_favorite_boarding_bloc.dart';
import '../student_home_page_tabbar_page/student_home_page_tabbar_view.dart';
import 'student_boarding_details_page_bloc.dart';

class StudentBoardingDetailsPageView extends StatefulWidget {
  final BoardModel board;
  const StudentBoardingDetailsPageView({required this.board, Key? key})
      : super(key: key);

  @override
  _StudentBoardingDetailsPageViewState createState() =>
      _StudentBoardingDetailsPageViewState();
}

class _StudentBoardingDetailsPageViewState
    extends State<StudentBoardingDetailsPageView> {
  bool isBook = false;
  bool isFav = false;
  @override
  FirebaseAuth auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    StudentBoardingDetailsPageBloc bloc =
        BlocProvider.of<StudentBoardingDetailsPageBloc>(context);
    GetFavoriteBoardingBloc favBloc =
        BlocProvider.of<GetFavoriteBoardingBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: CustomColors.BACKGROUND,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: CustomColors.PRIMARY,
        title: Text(widget.board.boardingName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.board.images.length,
                itemBuilder: (context, index) {
                  if (index == 0) return Container();
                  return Image.network(
                    widget.board.images[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.board.boardingName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 22.0,
                              color: CustomColors.SURFACED,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      isFav
                          ? InkWell(
                              onTap: () {
                                favBloc.add(RemoveFavoriteBoardingEvent(
                                    favBoarding: widget.board));
                                setState(() {
                                  isFav = false;
                                });
                              },
                              child: const Icon(
                                Icons.favorite,
                                color: CustomColors.ERROR,
                              ))
                          : InkWell(
                              onTap: () {
                                favBloc.add(AddFavoriteBoardingEvent(
                                    favBoarding: widget.board));
                                setState(() {
                                  isFav = true;
                                });
                              },
                              child: const Icon(Icons.favorite_border)),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.board.mobile,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 18.0,
                          color: CustomColors.SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.board.province,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 18.0,
                              color: CustomColors.SECONDARY,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        widget.board.city,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 18.0,
                              color: CustomColors.SECONDARY,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.board.boardingType,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 18.0,
                              color: CustomColors.SECONDARY,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Rs ${widget.board.boardingPrice}',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 18.0,
                              color: CustomColors.ERROR,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    color: CustomColors.PRIMARY,
                    child: Center(
                      child: Text(
                        'Comments',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 20.0,
                              color: CustomColors.BACKGROUND,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder<StudentBoardingDetailsPageBloc,
                      StudentBoardingDetailsPageState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      if (state.isLoading && state.allComments.isNotEmpty) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      return Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: bloc.commentTextEditingController,
                              decoration: const InputDecoration(
                                  hintText: 'Add your feedback'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (bloc.commentTextEditingController.text
                                  .isNotEmpty) {
                                bloc.add(AddCommentEvent(
                                    commnet: bloc
                                        .commentTextEditingController.text
                                        .trim()));
                                bloc.commentTextEditingController.clear();
                              }
                            },
                            child: Container(
                              width: 60.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: CustomColors.PRIMARY,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Add',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        fontSize: 16.0,
                                        color: CustomColors.BACKGROUND,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder<StudentBoardingDetailsPageBloc,
                      StudentBoardingDetailsPageState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Center(
                          child: Container(),
                        );
                      }
                      return SizedBox(
                        height: 500.0,
                        child: ListView.builder(
                            itemCount: state.allComments.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.comment,
                                      size: 20.0,
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.allComments[index].comment,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              fontSize: 16.0,
                                              color: CustomColors.SECONDARY,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    auth.currentUser!.uid ==
                                            state.allComments[index].userId
                                        ? InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                    elevation: 16,
                                                    child: Container(
                                                      width: 250.0,
                                                      height: 180.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        color: CustomColors
                                                            .BACKGROUND,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              'Confirm',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline4!
                                                                  .copyWith(
                                                                    color: CustomColors
                                                                        .SECONDARY,
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            const SizedBox(
                                                              height: 24.0,
                                                            ),
                                                            Text(
                                                              'Do you want to delete this comment?',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline4!
                                                                  .copyWith(
                                                                    color: CustomColors
                                                                        .SECONDARY,
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                PopupWindowButton(
                                                                  tap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  isDeteled:
                                                                      false,
                                                                ),
                                                                PopupWindowButton(
                                                                  tap:
                                                                      () async {
                                                                    try {
                                                                      setState(
                                                                          () async {
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection('comment')
                                                                            .doc(state.allComments[index].commnetId)
                                                                            .delete();
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        var snackBar = const SnackBar(
                                                                            backgroundColor:
                                                                                CustomColors.ERROR,
                                                                            content: Text('Deleted!'));
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(snackBar);
                                                                        Navigator.of(context)
                                                                            .push(
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const CustomerTabBarView(),
                                                                          ),
                                                                        );
                                                                      });
                                                                    } catch (e) {
                                                                      Future.error(
                                                                          e.toString());
                                                                    }
                                                                  },
                                                                  isDeteled:
                                                                      true,
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: CustomColors.ERROR,
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              );
                            }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isBook == true
            ? CustomMainButton(
                tap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          width: 250.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: CustomColors.BACKGROUND,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  'Confirm',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Text(
                                  'Do you want to Unbook this boarding?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PopupWindowButton(
                                      tap: () {
                                        Navigator.of(context).pop();
                                      },
                                      isDeteled: false,
                                    ),
                                    PopupWindowButton(
                                      btnText: 'Unbook',
                                      tap: () {
                                        try {
                                          setState(() {
                                            isBook = false;
                                          });
                                          Navigator.of(context).pop();
                                        } catch (e) {
                                          Future.error(e.toString());
                                        }
                                      },
                                      isDeteled: true,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                btnText: 'Booked')
            : InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          width: 250.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: CustomColors.BACKGROUND,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  'Confirm',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Text(
                                  'Do you want to book this boarding?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PopupWindowButton(
                                      tap: () {
                                        Navigator.of(context).pop();
                                      },
                                      isDeteled: false,
                                    ),
                                    PopupWindowButton(
                                      btnText: 'Book',
                                      tap: () {
                                        try {
                                          setState(() {
                                            isBook = true;
                                          });
                                          Navigator.of(context).pop();
                                        } catch (e) {
                                          Future.error(e.toString());
                                        }
                                      },
                                      isDeteled: true,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: CustomColors.PRIMARY,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Book',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 18.0,
                            color: CustomColors.PRIMARY,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
