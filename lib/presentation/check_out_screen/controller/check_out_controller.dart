import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/check_out_screen/models/check_out_model.dart';/// A controller class for the CheckOutScreen.
///
/// This class manages the state of the CheckOutScreen, including the
/// current checkOutModelObj
class CheckOutController extends GetxController {Rx<CheckOutModel> checkOutModelObj = CheckOutModel().obs;

 }
