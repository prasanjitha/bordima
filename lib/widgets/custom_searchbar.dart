import 'package:bordima/themes/custom_colors.dart';
import 'package:flutter/material.dart';

import '../views/bordOwner/search_board_page/search_board_page_provider.dart';

class CustoSearchBar extends StatelessWidget {
  const CustoSearchBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => SearchBoardPageProvider(type: 'main')),
          ),
        );
      },
      child: Container(
        width: width,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: CustomColors.LIGHTGREY,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: CustomColors.SECONDARY,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                'Search for boading',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 16,
                      color: CustomColors.SECONDARY,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
