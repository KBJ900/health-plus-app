import '../../../generated/assets.dart';
import '../controller/my_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class MyCartItemWidget extends StatelessWidget {
  final String? img;
  final String? name;
  final String? food;
  final String? price;
  MyCartItemWidget(
     {
    Key? key, this.img, this.name, this.food, this.price,
  }) : super(
          key: key,
        );



  var controller = Get.find<MyCartController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(builder: (controller) {
      return Container(
        padding: getPadding(
          all: 8,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath:img?? ImageConstant.imgRectangle44012,
              height: getSize(94),
              width: getSize(94),
              radius: BorderRadius.circular(
                getHorizontalSize(16),
              ),
            ),
            Expanded(
              child: Padding(
                padding: getPadding(left: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name??'Chicken biryani',style: theme.textTheme.titleMedium,),
                          Padding(
                            padding: getPadding(top: 8),
                            child: Text(food??'Rice',style: theme.textTheme.bodyLarge,),
                          ),

                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('\$$price',style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(16)
                        )),
                        Padding(
                          padding: getPadding(top: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              GestureDetector(
                                onTap: () {
                                  if(controller.itemsCount>1){
                                    controller.itemsCount = controller.itemsCount-1;
                                    controller.update();
                                  }
                                },
                                child: Container(
                                  padding:getPadding(all: 8.5),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(getHorizontalSize(12))
                                  ),
                                  child: CustomImageView(
                                    svgPath: Assets.imagesImgIcminus,
                                    height: getSize(15),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(left: 10,right: 10),
                                child: Text('0${controller.itemsCount}',style: theme.textTheme.bodyLarge,),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if(controller.itemsCount<9){
                                    controller.itemsCount = controller.itemsCount+1;
                                    controller.update();
                                  }
                                },
                                child: Container(
                                  padding:getPadding(all: 8.5),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(getHorizontalSize(12))
                                  ),
                                  child: CustomImageView(
                                    svgPath: Assets.imagesImgPlus ,
                                    height: getSize(15),
                                  ),
                                ),
                              ),



                            ],
                          ),
                        )

                      ],
                    )
                  ],
                ),
              ),
            )


            // Expanded(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Expanded(
            //         child: Padding(
            //           padding: getPadding(
            //             left: 16,
            //
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               Text(
            //                   'Chicken biryani',
            //                   style: theme.textTheme.titleMedium,
            //
            //               ),
            //               Text(
            //                   'Rice',
            //                   style: theme.textTheme.bodyLarge,
            //
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //            Text(
            //               '\$12.00',
            //               style: CustomTextStyles.titleMediumPrimary16,
            //
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               CustomIconButton(
            //                 height: getSize(32),
            //                 width: getSize(32),
            //                 padding: getPadding(
            //                   all: 6,
            //                 ),
            //                 child: CustomImageView(
            //                   svgPath: ImageConstant.imgMenu,
            //                 ),
            //               ),
            //               Padding(
            //                 padding: getPadding(
            //                   left: 10,
            //                   top: 5,
            //                   bottom: 6,
            //                 ),
            //                 child: Text(
            //                   "lbl_01".tr,
            //                   style: theme.textTheme.bodyLarge,
            //                 ),
            //               ),
            //               CustomIconButton(
            //                 height: getSize(32),
            //                 width: getSize(32),
            //                 margin: getMargin(
            //                   left: 11,
            //                 ),
            //                 padding: getPadding(
            //                   all: 6,
            //                 ),
            //                 child: CustomImageView(
            //                   svgPath: ImageConstant.imgPlus,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //
            //     ],
            //   ),
            // )
          ],
        ),
      );
    },init: MyCartController(),);
  }
}
