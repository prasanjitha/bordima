import 'package:bordima/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class BordingDetailsPageView extends StatefulWidget {
  const BordingDetailsPageView({Key? key}) : super(key: key);

  @override
  _BordingDetailsPageViewState createState() => _BordingDetailsPageViewState();
}

class _BordingDetailsPageViewState extends State<BordingDetailsPageView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                'https://thumbs.dreamstime.com/b/hotel-room-beautiful-orange-sofa-included-43642330.jpg',
                width: width,
                height: 350,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40.0,
                left: 20.0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.BACKGROUND,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Samath Board Place',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 22,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
