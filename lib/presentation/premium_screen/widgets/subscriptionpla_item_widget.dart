import '../controller/premium_controller.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class SubscriptionPlaItemWidget extends StatelessWidget {
  final String? title;
  final String? disc;
  final String? price;
  SubscriptionPlaItemWidget(
    {
    Key? key, this.title, this.disc, this.price,
  }) : super(
          key: key,
        );



  var controller = Get.find<PremiumController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(left: 20,right: 20),
      padding: getPadding(
        all: 16
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text(
                    title??'3 Month',
                    style: theme.textTheme.titleLarge,
                  ),

                Padding(
                  padding: getPadding(
                    top: 4,
                  ),
                  child: Text(
                      disc??'Renews after every 3 months',
                      style: CustomTextStyles.bodyLargeOnError_1.copyWith(height: 1.56),
                    ),

                ),
              ],
            ),
          ),
          Text(
              '\$$price',
              style: theme.textTheme.titleMedium,
            ),
        ],
      ),
    );
  }
}
