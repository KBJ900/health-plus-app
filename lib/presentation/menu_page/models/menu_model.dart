import 'package:get/get.dart';import 'ourmenu_item_model.dart';/// This class defines the variables used in the [menu_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MenuModel {Rx<List<OurMenuItemModel>> ourmenuItemList = Rx(List.generate(5,(index) => OurMenuItemModel()));

 }
