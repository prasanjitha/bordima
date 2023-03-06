import 'package:bordima/models/boarding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../themes/custom_colors.dart';
import '../bord_owner_tabbar_view/boad_owner_home_page_tabbar_view.dart';

class BoardingDetailsPageView extends StatefulWidget {
  final BoardModel board;
  const BoardingDetailsPageView({required this.board, Key? key})
      : super(key: key);

  @override
  _BoardingDetailsPageViewState createState() =>
      _BoardingDetailsPageViewState();
}

class _BoardingDetailsPageViewState extends State<BoardingDetailsPageView> {
  @override
  Widget build(BuildContext context) {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          width: 250.0,
                          height: 170.0,
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
                                  'Do you want to delete this boarding?',
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
                                    InkWell(
                                      onTap: () {
                                        final collection = FirebaseFirestore
                                            .instance
                                            .collection('boardings');
                                        collection
                                            .doc(widget.board.userId)
                                            .delete()
                                            .then((_) => print('Deleted'))
                                            .catchError((error) =>
                                                print('Delete failed: $error'));
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                const BordOwnerTabBarView()),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: CustomColors.PRIMARY,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Delete',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(
                                                  fontSize: 16.0,
                                                  color:
                                                      CustomColors.BACKGROUND,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        width: 120.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: CustomColors.PRIMARY,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Cancel',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(
                                                  fontSize: 16.0,
                                                  color: CustomColors.PRIMARY,
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
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: CustomColors.ERROR,
                )),
          )
        ],
      ),
      body: Column(
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
                Text(
                  widget.board.boardingName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 22.0,
                        color: CustomColors.SURFACED,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.board.mobile,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 20.0,
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
                            fontSize: 20.0,
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
                            fontSize: 20.0,
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
                            fontSize: 20.0,
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
                            fontSize: 20.0,
                            color: CustomColors.ERROR,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
