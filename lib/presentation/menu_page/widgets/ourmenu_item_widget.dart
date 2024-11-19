import '../controller/menu_controller.dart';
import '../models/ourmenu_item_model.dart';
import 'package:flutter/material.dart' hide MenuController;
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class OurMenuItemWidget extends StatelessWidget {
  final String? img;
  final String? name;
  final String? protein;
  final String? fat;
  final String? curb;
  final String? categories;

  OurMenuItemWidget(
    this.ourmenuItemModelObj, {
    Key? key,
    this.onTapOurmenu, this.img, this.name, this.protein, this.fat, this.curb, this.categories,
  }) : super(
          key: key,
        );

  OurMenuItemModel ourmenuItemModelObj;

  var controller = Get.find<MenuPageController>();

  VoidCallback? onTapOurmenu;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOurmenu?.call();
      },
      child: Container(
        margin: getMargin(left: 16,right: 16),
        padding: getPadding(
          all: 8,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: img??ImageConstant.imgRectangle4401,
              height: getSize(94),
              width: getSize(94),
              radius: BorderRadius.circular(
                getHorizontalSize(16),
              ),
            ),
            Expanded(
              child: Padding(
                padding: getPadding(left: 16,top: 2,bottom: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      name??'Fresh green salad',style:theme.textTheme.titleMedium,
                    ),

                    Padding(
                      padding:getPadding(top: 12),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(bottom: 6),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(protein??'35g',style: theme.textTheme.bodyLarge,),
                                    Padding(
                                      padding: getPadding(left: 4),
                                      child: Text('Protein',style: theme.textTheme.bodyMedium,),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(fat??'18g',style: theme.textTheme.bodyLarge,),
                                  Padding(
                                    padding: getPadding(left: 4),
                                    child: Text('Fat',style: theme.textTheme.bodyMedium,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: getPadding(left: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(bottom: 6),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(curb??'14g',style: theme.textTheme.bodyLarge,),
                                        Padding(
                                          padding: getPadding(left: 4),
                                          child: Text('Carb',style: theme.textTheme.bodyMedium,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(categories??'350',style: theme.textTheme.bodyLarge,),
                                      Padding(
                                        padding: getPadding(left: 4),
                                        child: Text('Categories',style: theme.textTheme.bodyMedium,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
