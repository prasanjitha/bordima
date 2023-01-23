// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'custom_text_styles.dart';
//import 'package:google_fonts/google_fonts.dart';

abstract class CustomThemes {
  CustomThemes._();

  static lightTheme(context) => ThemeData(
        primarySwatch: Colors.green,
        primaryColor: CustomColors.PRIMARY,
        scaffoldBackgroundColor: CustomColors.BACKGROUND,
        backgroundColor: CustomColors.BACKGROUND,
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
        dialogBackgroundColor: CustomColors.BACKGROUND,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: CustomColors.BACKGROUND,
          elevation: 0,
          iconTheme: IconThemeData(color: CustomColors.PRIMARY),
        ),
        textTheme: const TextTheme(
          headline1: CustomTextStyles.HEADLINE_LARGE_STYLE,
          headline2: CustomTextStyles.HEADLINE_MEDIUM_STYLE,
          headline3: CustomTextStyles.HEADLINE_SMALL_STYLE,
          headline4: CustomTextStyles.TITLE_MEDIUM_STYLE,
          headline5: CustomTextStyles.TITLE_SMALL_STYLE,
          subtitle1: CustomTextStyles.LABLE_MEDIUM_STYLE,
          subtitle2: CustomTextStyles.LABLE_SMALL_STYLE,
          headline6: CustomTextStyles.BUTTON_TEXT_STYLE,
        ),
      );
}
