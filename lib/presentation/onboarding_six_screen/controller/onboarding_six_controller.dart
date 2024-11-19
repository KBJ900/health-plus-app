import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/onboarding_six_screen/models/onboarding_six_model.dart';/// A controller class for the OnboardingSixScreen.
///
/// This class manages the state of the OnboardingSixScreen, including the
/// current onboardingSixModelObj
class OnboardingSixController extends GetxController {Rx<OnboardingSixModel> onboardingSixModelObj = OnboardingSixModel().obs;

Rx<int> sliderIndex = 0.obs;

 }
