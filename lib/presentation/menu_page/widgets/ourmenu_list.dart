import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/size_utils.dart';
import '../../../data/listdata/app_listdata.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/theme_helper.dart';
import '../models/ourmenu_item_model.dart';
import 'ourmenu_item_widget.dart';

class OurMenuList extends StatelessWidget {
  final String? list;
  const OurMenuList({this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:getPadding(left: 20,top: 20),
          child: Text("msg_60_lunch_dinner".tr, style: theme.textTheme.bodyLarge),
        ),
        Expanded(
          child: Padding(
            padding: getPadding(top: 18),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: getSize(16));
                },
                itemCount: AppListData.getOurMenu().length,
                itemBuilder: (context, index) {
                  OurMenuItemModel model = AppListData.getOurMenu()[index];
                  return OurMenuItemWidget(
                    model,
                    img: AppListData.getOurMenu()[index].img,
                    protein: AppListData.getOurMenu()[index].protein,
                    fat: AppListData.getOurMenu()[index].fat,
                    curb: AppListData.getOurMenu()[index].carb,
                    categories: AppListData.getOurMenu()[index].categories,
                    onTapOurmenu: () {
                      onTapOurmenu();
                    },

                  );
                }
            ),
          ),
        ),
      ],
    );
  }
  onTapOurmenu() {
    Get.toNamed(
      AppRoutes.detailsScreen,
    );
  }
}
