import 'package:get/get.dart';import 'subscriptionpla_item_model.dart';/// This class defines the variables used in the [premium_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PremiumModel {Rx<List<SubscriptionPlaItemModel>> subscriptionplaItemList = Rx(List.generate(4,(index) => SubscriptionPlaItemModel()));

 }
