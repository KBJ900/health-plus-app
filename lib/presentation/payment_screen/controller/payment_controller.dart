import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/payment_screen/models/payment_model.dart';/// A controller class for the PaymentScreen.
///
/// This class manages the state of the PaymentScreen, including the
/// current paymentModelObj
class PaymentController extends GetxController {Rx<PaymentModel> paymentModelObj = PaymentModel().obs;

Rx<String> radioGroup = "".obs;

Rx<String> radioGroup1 = "".obs;

Rx<String> radioGroup2 = "".obs;

bool isGoogle = true;
bool isPayPal = false;
bool isMasterCard = false;

String selectMethod ='';

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

 }
