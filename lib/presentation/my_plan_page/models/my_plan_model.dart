import 'package:get/get.dart';import 'myplan_item_model.dart';/// This class defines the variables used in the [my_plan_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MyPlanModel {Rx<List<MyPlanItemModel>> myplanItemList = Rx(List.generate(6,(index) => MyPlanItemModel()));

 }
