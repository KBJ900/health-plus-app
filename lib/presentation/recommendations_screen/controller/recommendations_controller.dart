import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/recommendations_screen/models/recommendations_model.dart';/// A controller class for the RecommendationsScreen.
///
/// This class manages the state of the RecommendationsScreen, including the
/// current recommendationsModelObj
class RecommendationsController extends GetxController {Rx<RecommendationsModel> recommendationsModelObj = RecommendationsModel().obs;

 }
