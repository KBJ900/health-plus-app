import 'package:get/get.dart';

import 'popularrecipe_item_model.dart';

/// This class defines the variables used in the [what_for_lunch_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class WhatForLunchModel {
  Rx<List<PopularrecipeItemModel>> popularrecipeItemList =
      Rx(List.generate(6, (index) => PopularrecipeItemModel()));

  int?id;
  String? img;
  String? name;
  String? time;
  String? kcal;

  WhatForLunchModel({
   this.id,
   this.img,
   this.name,
   this.time,
   this.kcal,
});

}
