// ignorar_por_archivo: uso_miembro_obsoleto

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/pref_data/pref_data.dart';
import 'package:diet_recipe_app/presentation/my_profile_screen/widget/myprofile_ope.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_icon_button.dart';

import '../../generated/assets.dart';
import 'controller/my_profile_controller.dart';

// ignorar_por_archivo: debe_ser_inmutable
class MyProfileScreen extends GetWidget<MyProfileController> {
  MyProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () {
        return onTapBack();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          body: SafeArea(
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppBarText(
                        onTap: () => Get.back(),
                        title: 'Mi perfil',
                        rightIcon: CustomImageView(
                          onTap: () {
                            Get.toNamed(AppRoutes.editProfileScreen);
                          },
                          svgPath: Assets.imagesImgEdit,
                          height: getSize(24),
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 24, left: 20, right: 20,bottom: 32),
                        child: Row(children: [
                          Container(
                              height: getSize(100),
                              width: getSize(100),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: fs.Svg(ImageConstant.imgAvtar1),
                                      fit: BoxFit.cover)),
                              child: CustomIconButton(
                                  height: getSize(40),
                                  width: getSize(40),
                                  padding: getPadding(all: 8),
                                  decoration: IconButtonStyleHelper.fillGrayTL20,
                                  alignment: Alignment.bottomRight,
                                  onTap: () {
                                    onTapBtnClockone();
                                  },
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgClockBlack900))),
                          Padding(
                              padding: getPadding(left: 15, top: 23, bottom: 23),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_john_abram2".tr,
                                        style: theme.textTheme.titleMedium),
                                    Padding(
                                        padding: getPadding(top: 11),
                                        child: Text("msg_johnabram_gmail_com".tr,
                                            style: theme.textTheme.bodyLarge))
                                  ]))
                        ]),
                      ),

                      MyProfileOpe(),
                      MyProfileOpe(
                        title: 'Apellido',
                        personInfo: 'Abram xd',
                      ),
                      MyProfileOpe(
                        personInfo: 'johnabram@gmail.com',
                        title: 'Dirección de correo electrónico',
                      ),
                    ],
                ),
            ),
          ),
      ),
    );
  }

  onTapEditone() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }

  onTapBtnClockone() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }
  onTapBack() {
    PrefData.currentIndex = 4;
    controller.update();
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }
}
