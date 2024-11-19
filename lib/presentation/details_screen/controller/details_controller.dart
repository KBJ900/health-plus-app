import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/details_screen/models/details_model.dart';/// A controller class for the DetailsScreen.
///
/// This class manages the state of the DetailsScreen, including the
/// current detailsModelObj
class DetailsController extends GetxController {
 Rx<DetailsModel> detailsModelObj = DetailsModel().obs;

 int item =1;

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

 }
