import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/onboarding_four_screen/models/onboarding_four_model.dart';


class OnboardingFourController extends GetxController {
  Rx<OnboardingFourModel> onboardingFourModelObj = OnboardingFourModel().obs;

  int index = 0;
  changeScreen(int value){
   index = value;
   update();
  }



  Rx<int> sliderIndex = 0.obs;
}
