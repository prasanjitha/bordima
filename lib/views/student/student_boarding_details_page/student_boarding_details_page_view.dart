import 'package:bordima/models/boarding.dart';
import 'package:bordima/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';
import '../../../themes/custom_colors.dart';

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
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Add your feedback'),
                        ),
                      ),
                      Container(
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
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontSize: 16.0,
                                      color: CustomColors.BACKGROUND,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: CustomColors.PRIMARY,
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(20),
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_960_720.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text(
                          'Discover the innovative world of Apple and shop everything iPhone, iPad, Apple Watch, Mac, and Apple TV, plus explore accessories, entertainment',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                    ],
                  )
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
                  setState(() {
                    isBook = false;
                  });
                },
                btnText: 'Booked')
            : InkWell(
                onTap: () {
                  setState(() {
                    isBook = true;
                  });
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
