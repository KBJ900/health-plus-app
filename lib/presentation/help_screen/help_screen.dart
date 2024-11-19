import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/help_screen/widget/help_qna.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'controller/help_controller.dart';

class HelpScreen extends GetWidget<HelpController> {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               AppBarText(
                onTap: () => Get.back(),
                title: 'Help',
               ),
                Expanded(
                  child: Padding(
                    padding: getPadding(top: 16),
                    child: HelpQna(
                      question:'What is the balance diet?',
                      ans: 'Balanced diet contains all of the essential elements that the human body needs. Carbohydrates, lipids, vitamins, minerals, proteins, fiber, and water',
                    ),
                  ),
                ),

              ]),
        ));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
