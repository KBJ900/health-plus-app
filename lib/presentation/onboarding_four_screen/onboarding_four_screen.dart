import 'package:dots_indicator/dots_indicator.dart';
import '../../data/listdata/app_listdata.dart';
import '../../data/pref_data/pref_data.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/onboarding_four_controller.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';


// ignore_for_file: must_be_immutable
class OnboardingFourScreen extends GetWidget<OnboardingFourController> {
  const OnboardingFourScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(
      initialPage: 0,

    );
    mediaQueryData = MediaQuery.of(context);

    return GetBuilder<OnboardingFourController>(builder: (onController) {
      return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: SafeArea(
          // child: Padding(
          //   padding: getPadding(left: 16,right: 16),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Align(
          //         alignment: Alignment.centerRight,
          //         child: Text(
          //           "lbl_skip".tr,
          //           style: theme.textTheme.bodyLarge,
          //         ),
          //       ),
          //       Flexible(
          //         child: CustomImageView(
          //           imagePath: ImageConstant.imgWhiteplatewit,
          //
          //           margin: getMargin(
          //             top: 30,
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: getPadding(
          //           left: 13,
          //           top: 52,
          //           right: 13,
          //         ),
          //         child: Obx(
          //           () => CarouselSlider.builder(
          //             options: CarouselOptions(
          //               height: getVerticalSize(102),
          //               initialPage: 0,
          //               autoPlay: true,
          //               viewportFraction: 1.0,
          //               enableInfiniteScroll: false,
          //               scrollDirection: Axis.horizontal,
          //               onPageChanged: (
          //                 index,
          //                 reason,
          //               ) {
          //                 controller.sliderIndex.value = index;
          //               },
          //             ),
          //             itemCount: controller.onboardingFourModelObj.value
          //                 .foodcolumnItemList.value.length,
          //             itemBuilder: (context, index, realIndex) {
          //               FoodcolumnItemModel model = controller
          //                   .onboardingFourModelObj
          //                   .value
          //                   .foodcolumnItemList
          //                   .value[index];
          //               return FoodcolumnItemWidget(
          //                 model,
          //               );
          //             },
          //           ),
          //         ),
          //       ),
          //       Obx(
          //         () => Container(
          //           height: getVerticalSize(8),
          //           margin: getMargin(
          //             top: 42,
          //             bottom: 5,
          //           ),
          //           child: AnimatedSmoothIndicator(
          //             activeIndex: controller.sliderIndex.value,
          //             count: controller.onboardingFourModelObj.value
          //                 .foodcolumnItemList.value.length,
          //             axisDirection: Axis.horizontal,
          //             effect: ScrollingDotsEffect(
          //               spacing: 8,
          //               activeDotColor: theme.colorScheme.primary,
          //               dotColor: appTheme.blueGray100,
          //               dotHeight: getVerticalSize(8),
          //               dotWidth: getHorizontalSize(8),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: getPadding(right: 20,top: 16),
                  child: onController.index<2?GestureDetector(
                    onTap: () {
                      PrefData.setIntro(false);
                      Get.toNamed(
                        AppRoutes.loginScreen,
                      );
                    },
                    child: Text('Skip',style: TextStyle(
                      color: Colors.black,
                      fontSize: getFontSize(16),
                      fontWeight: FontWeight.w400,
                    ),),
                  ):SizedBox(),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  physics: BouncingScrollPhysics(),
                  itemCount: AppListData.onboardingList.length,
                  onPageChanged: (value) {
                    onController.changeScreen(value);
                    onController.update();
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child:Padding(
                            padding: onController.index==2?getPadding(
                                top: 55,
                                bottom: 50,
                              // left: 16,
                              // right: 16,


                                ):getPadding(
                              left: 16,right: 16,bottom: 15
                            ),
                            child: CustomImageView(
                              imagePath: AppListData.onboardingList[index].img,
                              fit: BoxFit.contain,
                              margin:onController.index==2? getMargin(
                                top: 40,
                              ):getMargin(top: 29),
                            ),
                          ),
                        ),
                        Padding(
                          padding:getPadding(top: 45),
                          child: Text(AppListData.onboardingList[index].title??'Deliicious food',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(28),
                          ),),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:getPadding(left: 40,right: 40,top: 24,),
                            child: Text(AppListData.onboardingList[index].details??'Arguably South India s most renowned culinary export, masala dosas are famous the world over',style: TextStyle(
                              color: Color(0xFF808080),
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16),
                            ),textAlign: TextAlign.center,),
                          ),
                        ),


                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: getPadding(bottom: 48,top: 40),
                child: DotsIndicator(
                  dotsCount: 3,
                  position: onController.index,
                  decorator: DotsDecorator(

                    size:  Size.square(getSize(8),),
                    activeSize:  Size( getSize(24),getSize(8))  ,
                    spacing: EdgeInsets.only(right: getSize(6)),
                    activeColor: theme.colorScheme.primary,
                    color: Color(0xFFD9D9D9),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),

              CustomElevatedButton(
                  text: onController.index==2?'Get started':'Next',
                  margin: getMargin(left: 20, right: 20,bottom: 40),
                  onTap: () {
                    if(onController.index ==
                        onController.index - 1){

                    }
                    else if(onController.index==2){
                      PrefData.setIntro(false);
                      Get.toNamed(
                        AppRoutes.loginScreen,
                      );
                    }
                    else{
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn);
                    }
                  }),
            ],
          ),
        ),


      );
    },init: OnboardingFourController(),);
  }
}
