import 'package:diet_recipe_app/core/app_export.dart';

import '../../../data/pref_data/pref_data.dart';



class SplashController extends GetxController {


  // @override
  // void onReady() {
  //   Future.delayed(const Duration(milliseconds: 4000), () {
  //     Get.offNamed(
  //       AppRoutes.onboardingFourScreen,
  //     );
  //   });
  // }

  @override void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      bool isIntro = await PrefData.getIntro();
      bool isLogin = await PrefData.getLogin();
      // bool isInfo = await PrefData.getInfo();

      if (isIntro) {
        Get.toNamed(AppRoutes.onboardingFourScreen
          ,);
      }
      else {
        if (isLogin) {
          Get.toNamed(AppRoutes.loginScreen,);
        }
        else {


            Get.toNamed(AppRoutes.homeScreenContainerScreen,);

        }
      }}
    );
  }
}
