import 'package:diet_recipe_app/presentation/profile_page/widget/profile_ope.dart';

import '../../data/pref_data/pref_data.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key})
      : super(
          key: key,
        );

  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:getPadding(top: 29,left: 20),
              child: Text(
                "lbl_profile".tr,
                style: theme.textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 40,right: 20,left: 20,bottom: 32
              ),
              child: Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgAvtar1,
                    height: getSize(100),
                    width: getSize(100),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 15,
                      top: 23,
                      bottom: 23,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_john_abram2".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 11,
                          ),
                          child: Text(
                            "msg_johnabram_gmail_com".tr,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           ProfileOpe(
             onTapOption: () {
               Get.toNamed(AppRoutes.myProfileScreen);
             },
           ),
           ProfileOpe(
             onTapOption: () {
               Get.toNamed(AppRoutes.settingsScreen);
             },
             optionName: 'Settings',
             optionImg: ImageConstant.imgSettings,
           ),
           ProfileOpe(
             onTapOption: () {
               Get.toNamed(AppRoutes.privacyPolicyScreen);
             },
             optionName: 'Privacy policy',
             optionImg: ImageConstant.imgCheckmark  ,
           ),
           ProfileOpe(
             onTapOption: () {
               Get.toNamed(AppRoutes.premiumScreen);
             },
             optionName: 'Premium',
             optionImg: ImageConstant.imgMap,
           ),
           ProfileOpe(
             onTapOption: () {
               showDialog<String>(
                 context: context,
                 builder: (BuildContext context) => AlertDialog(
                   backgroundColor: Colors.white,
                   shape:  RoundedRectangleBorder(borderRadius:
                   BorderRadius.all(Radius.circular(getHorizontalSize(16)))),
                   insetPadding: getPadding(left:16,right: 16),
                   title: Padding(
                     padding: getPadding(left: 15,right: 15),
                     child: Text('Are you sure you want to Log Out ?',style: TextStyle(
                       color: Colors.black,
                       fontSize: getFontSize(22),
                       fontWeight: FontWeight.w600,
                     ),textAlign: TextAlign.center),
                   ),

                   actions: <Widget>[
                     Padding(
                       padding: getPadding(bottom: 20),
                       child: Row(
                         children: [
                           Expanded(
                             child: GestureDetector(
                               onTap: () {
                                 Get.back();
                               },
                               child: Padding(
                                 padding: getPadding(left: getSize(15)),
                                 child: Container(
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8),
                                       border: Border.all(
                                         color:  AppColor.main,
                                         width: getSize(1.5),
                                       )
                                   ),
                                   child: Padding(
                                     padding:  getPadding(top: getSize(14),bottom: getSize(14)),
                                     child: Center(
                                       child: Text(
                                         'No',style: TextStyle(
                                         color:  AppColor.main,
                                         fontSize: getFontSize(18),
                                         fontWeight: FontWeight.w700,
                                       ),

                                         textAlign: TextAlign.center,

                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             width: getSize(20),
                           ),
                           Expanded(
                             child: GestureDetector(
                               onTap: ()  {
                                 PrefData.currentIndex =0;
                                 PrefData.setLogin(true);
                                 Get.toNamed(
                                   AppRoutes.loginScreen,
                                 );

                               },
                               child: Padding(
                                 padding: getPadding(right: getSize(15)),
                                 child: Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(8),
                                     color: AppColor.main,
                                   ),
                                   child: Padding(
                                     padding:  getPadding(top: getSize(14),bottom: getSize(14)),
                                     child: Center(
                                       child: Text(
                                         'Yes',style: TextStyle(
                                         color: Colors.white,
                                         fontSize: getFontSize(18),
                                         fontWeight: FontWeight.w700,
                                       ),

                                         textAlign: TextAlign.center,

                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               );
               controller.update();
             },
             optionName: 'Log out',
             optionImg:  ImageConstant.imgReply,
           ),

          ],
        ),
      ),
    );
  }
}
