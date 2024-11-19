import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

class AppDecoration {
  // Black decorations
  static BoxDecoration get black => BoxDecoration(
        color: appTheme.black900.withOpacity(0.53),
      );

  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.51),
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue100,
      );
  static BoxDecoration get fillCyan => BoxDecoration(
        color: appTheme.cyan5001,
      );
  static BoxDecoration get fillCyan50 => BoxDecoration(
        color: appTheme.cyan50,
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange100,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: appTheme.gray200,
      );
  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green50,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo100,
      );
  static BoxDecoration get fillLightGreen => BoxDecoration(
        color: appTheme.lightGreen100,
      );
  static BoxDecoration get fillLime => BoxDecoration(
        color: appTheme.lime100,
      );
  static BoxDecoration get fillOnSecondary => BoxDecoration(
        color: theme.colorScheme.onSecondary,
      );
  static BoxDecoration get fillOrange => BoxDecoration(
        color: appTheme.orange300,
      );
  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple5001,
      );
  static BoxDecoration get fillPurple50 => BoxDecoration(
        color: appTheme.purple50,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red100,
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal5001,
      );
  static BoxDecoration get fillTeal50 => BoxDecoration(
        color: appTheme.teal50,
      );
  static BoxDecoration get fillTeal5002 => BoxDecoration(
        color: appTheme.teal5002,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToOnPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 0.97),
          colors: [
            appTheme.black900.withOpacity(0.6),
            theme.colorScheme.onPrimary,
          ],
        ),
      );

  // Green decorations
  static BoxDecoration get green => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.07),
            spreadRadius: getHorizontalSize(2),
            blurRadius: getHorizontalSize(2),
            offset: Offset(
              0,
              6,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGreenA => BoxDecoration(
        border: Border.all(
          color: appTheme.greenA700.withOpacity(0.5),
          width: getHorizontalSize(1),
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: getHorizontalSize(1),
        ),
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder12 => BorderRadius.circular(
        getHorizontalSize(12),
      );
  static BorderRadius get circleBorder20 => BorderRadius.circular(
        getHorizontalSize(20),
      );
  static BorderRadius get circleBorder31 => BorderRadius.circular(
        getHorizontalSize(31),
      );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        getHorizontalSize(50),
      );

  // Custom borders
  static BorderRadius get customBorderTL24 => BorderRadius.vertical(
        top: Radius.circular(getHorizontalSize(24)),
      );

  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        getHorizontalSize(16),
      );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        getHorizontalSize(24),
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.
    
// For Flutter SDK Version 3.7.2 or greater.
    
double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    