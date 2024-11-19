import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/number_of_snacks_screen/models/number_of_snacks_model.dart';/// A controller class for the NumberOfSnacksScreen.
///
/// This class manages the state of the NumberOfSnacksScreen, including the
/// current numberOfSnacksModelObj
class NumberOfSnacksController extends GetxController {Rx<NumberOfSnacksModel> numberOfSnacksModelObj = NumberOfSnacksModel().obs;

 }
