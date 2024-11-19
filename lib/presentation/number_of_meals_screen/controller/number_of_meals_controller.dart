import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/number_of_meals_screen/models/number_of_meals_model.dart';/// A controller class for the NumberOfMealsScreen.
///
/// This class manages the state of the NumberOfMealsScreen, including the
/// current numberOfMealsModelObj
class NumberOfMealsController extends GetxController {Rx<NumberOfMealsModel> numberOfMealsModelObj = NumberOfMealsModel().obs;

 }
