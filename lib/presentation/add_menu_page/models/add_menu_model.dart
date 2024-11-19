import 'package:get/get.dart';import 'menuitem_item_model.dart';/// This class defines the variables used in the [add_menu_page],
/// and is typically used to hold data that is passed between different parts of the application.
class AddMenuModel {Rx<List<MenuitemItemModel>> menuitemItemList = Rx(List.generate(5,(index) => MenuitemItemModel()));

 }
