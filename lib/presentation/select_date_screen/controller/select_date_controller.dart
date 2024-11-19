import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/select_date_screen/models/select_date_model.dart';


class SelectDateController extends GetxController {
  Rx<SelectDateModel> selectDateModelObj = SelectDateModel().obs;

  String?  selectedTime;
   String?  selectedDate;
   String? data;
   String? endDate;

   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
