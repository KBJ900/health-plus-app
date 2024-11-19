import 'package:get/get.dart';
import 'package:diet_recipe_app/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_new_address_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddNewAddressModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Gujarat",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Maharashtra",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Utter Pradesh",
    )
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Ahmedabad",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Rajkot",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Vadodara",
    )
  ]);
}
