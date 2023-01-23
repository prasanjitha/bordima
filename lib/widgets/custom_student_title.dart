import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class CustomStudentTitle extends StatelessWidget {
  const CustomStudentTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Prasanjith',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 18,
                    color: CustomColors.SECONDARY,
                  ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'Find your bording place',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 22.0),
            ),
          ],
        ),
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
      ],
    );
  }
}
