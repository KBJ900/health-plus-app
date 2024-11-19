import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/premium_screen/models/premium_model.dart';/// A controller class for the PremiumScreen.
///
/// This class manages the state of the PremiumScreen, including the
/// current premiumModelObj
class PremiumController extends GetxController {Rx<PremiumModel> premiumModelObj = PremiumModel().obs;

 }
