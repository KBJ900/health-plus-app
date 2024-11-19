import 'package:diet_recipe_app/core/app_export.dart';


class ChooseYourPlanStandardOneController extends GetxController {




  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  SelectionPopupModel? selectedDropDownValue5;

  SelectionPopupModel? selectedDropDownValue6;

  SelectionPopupModel? selectedDropDownValue7;

  bool isStart =false;
  bool isEnd =false;

    String planDuration ='';
    String daysPerWeek ='';
    String selectStartDate ='';
    String selectEndDate ='';
    String numberOfMeal ='';
    String selectMonth ='';
    String numOfSnacks ='';
    String numOfWeeks ='';


    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
