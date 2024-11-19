import 'package:get/get.dart';import 'shippingaddress_item_model.dart';import 'fooditem_item_model.dart';/// This class defines the variables used in the [check_out_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CheckOutModel {Rx<List<ShippingaddressItemModel>> shippingaddressItemList = Rx(List.generate(2,(index) => ShippingaddressItemModel()));

Rx<List<FooditemItemModel>> fooditemItemList = Rx(List.generate(3,(index) => FooditemItemModel()));

 }
