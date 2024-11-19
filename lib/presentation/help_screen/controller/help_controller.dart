import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/help_screen/models/help_model.dart';

/// A controller class for the HelpScreen.
///
/// This class manages the state of the HelpScreen, including the
/// current helpModelObj
class HelpController extends GetxController {
  Rx<HelpModel> helpModelObj = HelpModel().obs;

  bool tileExpanded = false;
  bool tillTwo = false;
  bool tillThree = false;
  bool tillFour = false;
  bool tillFive = false;
  bool tillSix = false;
}
