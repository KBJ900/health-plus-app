import 'package:diet_recipe_app/data/listdata/app_listdata.dart';

import '../add_menu_page/widgets/menuitem_item_widget.dart';
import 'controller/add_menu_controller.dart';
import 'models/add_menu_model.dart';
import 'models/menuitem_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class AddMenuPage extends StatelessWidget {
  AddMenuPage({Key? key})
      : super(
          key: key,
        );

  AddMenuController controller = Get.put(AddMenuController(AddMenuModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return  ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: getPadding(top: 24),

        shrinkWrap: true,
        separatorBuilder: (
            context,
            index,
            ) {
          return SizedBox(
            height: getVerticalSize(16),
          );
        },
        itemCount: AppListData.addMenuList.length,
        itemBuilder: (context, index) {
          MenuitemItemModel model = controller
              .addMenuModelObj.value.menuitemItemList.value[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.detailsScreen);
            },
            child: MenuItemList(


              model,
              img: AppListData.addMenuList[index].img,
              name: AppListData.addMenuList[index].name,
              protein: AppListData.addMenuList[index].protein,
              fat: AppListData.addMenuList[index].fat,
              carb: AppListData.addMenuList[index].carb,
              categories: AppListData.addMenuList[index].categories,
            ),
          );
        },
      );

  }
}
