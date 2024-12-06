import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../my_plan_page/widgets/myplan_item_widget.dart';
import 'controller/my_plan_controller.dart';
import 'models/my_plan_model.dart';

class MyPlanPage extends StatefulWidget {
  MyPlanPage({Key? key}) : super(key: key);

  @override
  _MyPlanPageState createState() => _MyPlanPageState();
}

class _MyPlanPageState extends State<MyPlanPage> {
  MyPlanController controller = Get.put(MyPlanController(MyPlanModel().obs));
  List<dynamic> mealPlans = [];

  @override
  void initState() {
    super.initState();
    fetchMealPlans();
  }

  Future<void> fetchMealPlans() async {
    final url = Uri.parse('https://health-back-lingering-wave-8458.fly.dev/api/mealPlanRoutes/meal-plan/3');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          mealPlans = data['mealPlans'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los planes de alimentación')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la conexión')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(top: 29, left: 20),
            child: Text("lbl_my_plan".tr, style: theme.textTheme.headlineMedium),
          ),
          mealPlans.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    padding: getPadding(top: 16),
                    itemCount: mealPlans.length,
                    itemBuilder: (context, index) {
                      final mealPlan = mealPlans[index];
                      return MyPlanItemWidget(
                        onTapMyplan: () {
                          onTapMyplan();
                        },
                        planName: mealPlan['name'],
                        date: mealPlan['created_at'],
                        isPending: false, // Assuming isPending is not available in the API response
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  onTapMyplan() {
    Get.toNamed(AppRoutes.runningPlanDetailsScreen);
  }
}