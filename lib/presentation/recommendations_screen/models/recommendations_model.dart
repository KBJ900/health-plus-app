import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'recommendations_item_model.dart';


class RecommendationsModel {
  Rx<List<RecommendationsItemModel>> recommendationsItemList =
      Rx(List.generate(8, (index) => RecommendationsItemModel()));

  String? img;
  String? name;
  Color? backColor;

  RecommendationsModel({
   this.img,
   this.name,
   this.backColor,
});
}
