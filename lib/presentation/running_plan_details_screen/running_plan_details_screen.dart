import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'controller/running_plan_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_icon_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore_for_file: must_be_immutable
class RunningPlanDetailsScreen extends GetWidget<RunningPlanDetailsController> {
  const RunningPlanDetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarText(
              onTap: () => Get.back(),
              title: 'Tu plan de alimentación',
            ),
            Container(
              margin: getMargin(top: 16),
              decoration: AppDecoration.fillGreen.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Container(
                width: getHorizontalSize(388),
                padding: getPadding(
                  left: 16,
                  top: 19,
                  right: 16,
                  bottom: 19,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: fs.Svg(
                      ImageConstant.imgGroup153,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_running_plan".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 12,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "lbl_100".tr,
                                  style: theme.textTheme.bodyLarge,
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 2,
                                  ),
                                  child: Text(
                                    "lbl_protein".tr,
                                    style: CustomTextStyles.bodyMediumBlack900,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 16,
                                  ),
                                  child: Text(
                                    "lbl_50".tr,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 2,
                                  ),
                                  child: Text(
                                    "lbl_carb".tr,
                                    style: CustomTextStyles.bodyMediumBlack900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomIconButton(
                      height: getSize(56),
                      width: getSize(56),
                      margin: getMargin(
                        right: 3,
                      ),
                      padding: getPadding(
                        all: 12,
                      ),
                      decoration: IconButtonStyleHelper.fillPrimary,
                      child: CustomImageView(
                        svgPath: ImageConstant.imgIcrunning,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           Expanded(
              child: FutureBuilder(
                future: fetchMealPlans(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error al cargar los alimentos'));
                  } else {
                    final mealPlans = snapshot.data as List<dynamic>;
                    return ListView.builder(
                      padding: getPadding(top: 16),
                      itemCount: mealPlans.length,
                      itemBuilder: (context, index) {
                        final mealPlan = mealPlans[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: mealPlan['MealPlanFood'].map<Widget>((foodItem) {
                            final food = foodItem['food'];
                            return Padding(
                              padding: getPadding(bottom: 16),
                              child: Container(
                                padding: getPadding(all: 16),
                                decoration: AppDecoration.fillGray.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food['name'],
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    Padding(
                                      padding: getPadding(top: 8),
                                      child: Text(
                                        food['description'],
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(top: 8),
                                      child: Text(
                                        'Kcal: ${food['kcal']}, Fat: ${food['fat']}g, Protein: ${food['protein']}g, Carbs: ${food['carbs']}g',
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            ],
        ),
      ),

    );
  }

  Future<List<dynamic>> fetchMealPlans() async {
    final url = Uri.parse('https://health-back-lingering-wave-8458.fly.dev/api/mealPlanRoutes/meal-plan/3');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['mealPlans'];
      } else {
        throw Exception('Error al cargar los planes de alimentación');
      }
    } catch (e) {
      throw Exception('Error en la conexión');
    }
  }
}