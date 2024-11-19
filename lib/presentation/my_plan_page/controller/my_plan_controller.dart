import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/my_plan_page/models/my_plan_model.dart';/// A controller class for the MyPlanPage.
///
/// This class manages the state of the MyPlanPage, including the
/// current myPlanModelObj
class MyPlanController extends GetxController {MyPlanController(this.myPlanModelObj);

Rx<MyPlanModel> myPlanModelObj;

 }
