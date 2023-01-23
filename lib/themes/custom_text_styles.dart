// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'custom_colors.dart';

// Todo: delete this file

abstract class CustomTextStyles {
  CustomTextStyles._();

  static const HEADLINE_LARGE_STYLE = TextStyle(
    color: CustomColors.SURFACED,
    fontSize: 48,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
  );
  static const HEADLINE_MEDIUM_STYLE = TextStyle(
    color: CustomColors.SURFACED,
    fontSize: 32,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
  );
  static const HEADLINE_SMALL_STYLE = TextStyle(
    color: CustomColors.SURFACED,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
  );
  static const TITLE_MEDIUM_STYLE = TextStyle(
    color: CustomColors.SURFACED,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
  );
  static const TITLE_SMALL_STYLE = TextStyle(
    color: CustomColors.SURFACED,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
  );
  static const LABLE_MEDIUM_STYLE = TextStyle(
    color: CustomColors.SECONDARY,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );
  static const LABLE_SMALL_STYLE = TextStyle(
    color: CustomColors.SECONDARY,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );
  static const BUTTON_TEXT_STYLE = TextStyle(
    color: CustomColors.BACKGROUND,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
  );
  static const ERROR_TEXT_STYLE = TextStyle(
    color: CustomColors.BACKGROUND,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
  );
  static const TITLE_MEDIUMG_STYLE = TextStyle(
    color: CustomColors.SECONDARY,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
  );
}
