import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/onboarding_five_screen/models/onboarding_five_model.dart';/// A controller class for the OnboardingFiveScreen.
///
/// This class manages the state of the OnboardingFiveScreen, including the
/// current onboardingFiveModelObj
class OnboardingFiveController extends GetxController {Rx<OnboardingFiveModel> onboardingFiveModelObj = OnboardingFiveModel().obs;

Rx<int> sliderIndex = 0.obs;

 }
