import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/address_screen/models/address_model.dart';/// A controller class for the AddressScreen.
///
/// This class manages the state of the AddressScreen, including the
/// current addressModelObj
class AddressController extends GetxController {Rx<AddressModel> addressModelObj = AddressModel().obs;

Rx<String> radioGroup = "".obs;

Rx<String> radioGroup1 = "".obs;

bool isOffice = true;
String addOffice = '4517 Washington Ave. Manchester, Kentucky 39495';
bool isHome = false;
String addHome = '4891 Ranchview Dr. Richardson, near California 62639';
String selectAdd ='';

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

 }
