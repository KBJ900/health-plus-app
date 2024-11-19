import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diet_recipe_app/presentation/choose_your_plan_standard_one_page/controller/choose_your_plan_standard_one_controller.dart';

import '../../../core/utils/size_utils.dart';
import '../../../data/listdata/app_listdata.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/theme_helper.dart';
import '../../choose_your_plan_standard_tab_container_screen/widget/select_data.dart';

class SelectedData extends StatelessWidget {
  final String? namel;

  const SelectedData({this.namel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseYourPlanStandardOneController>(
      builder: (controller) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getHorizontalSize(24)),
                              topRight:
                                  Radius.circular(getHorizontalSize(24)))),
                      child: Padding(
                        padding: getPadding(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: getPadding(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Plan duration',
                                    style: theme.textTheme.titleLarge,
                                  )),
                                  GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Icon(
                                        Icons.close,
                                        size: getSize(24),
                                      ))
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                padding: getPadding(
                                  left: 20,
                                  right: 20,
                                  bottom: 24,
                                ),
                                shrinkWrap: true,
                                itemCount: AppListData.planDuration.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.planDuration =
                                          AppListData.planDuration[index];
                                      controller.update();
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: getPadding(top: 16),
                                      child: Text(
                                        AppListData.planDuration[index],
                                        style:
                                            theme.textTheme.bodyLarge!.copyWith(
                                          height: 1.56,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: getPadding(top: 24),
                child: SelectData(
                  selectData: controller.planDuration.isEmpty
                      ? 'Plan duration'
                      : controller.planDuration,
                  fontColor: controller.planDuration.isEmpty
                      ? AppColor.grey400
                      : AppColor.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getHorizontalSize(24)),
                              topRight:
                                  Radius.circular(getHorizontalSize(24)))),
                      child: Padding(
                        padding: getPadding(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: getPadding(
                                left: 20,
                                right: 20,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Days per week',
                                    style: theme.textTheme.titleLarge,
                                  )),
                                  GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Icon(
                                        Icons.close,
                                        size: getSize(24),
                                      ))
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                padding: getPadding(
                                    left: 20, right: 20, bottom: 24, top: 0),
                                shrinkWrap: true,
                                itemCount: AppListData.daysPerWeek.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.daysPerWeek =
                                          AppListData.daysPerWeek[index];
                                      controller.update();
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: getPadding(top: 16),
                                      child: Text(
                                        AppListData.daysPerWeek[index],
                                        style:
                                            theme.textTheme.bodyLarge!.copyWith(
                                          height: 1.56,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SelectData(
                selectData: controller.daysPerWeek.isEmpty
                    ? 'Days per week'
                    : controller.daysPerWeek,
                fontColor: controller.daysPerWeek.isEmpty
                    ? AppColor.grey400
                    : AppColor.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.isStart = true;
                Get.toNamed(AppRoutes.selectDateScreen);
              },
              child: SelectData(
                selectData: controller.selectStartDate.isEmpty
                    ? 'Select start date'
                    : controller.selectStartDate,
                fontColor: controller.selectStartDate.isEmpty
                    ? AppColor.grey400
                    : AppColor.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.isEnd = true;
                Get.toNamed(AppRoutes.selectDateScreen);
              },
              child: SelectData(
                selectData: controller.selectEndDate.isEmpty
                    ? 'Select end date'
                    : controller.selectEndDate,
                fontColor: controller.selectEndDate.isEmpty
                    ? AppColor.grey400
                    : AppColor.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getHorizontalSize(24)),
                              topRight:
                                  Radius.circular(getHorizontalSize(24)))),
                      child: Padding(
                        padding: getPadding(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: getPadding(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Number of meals',
                                    style: theme.textTheme.titleLarge,
                                  )),
                                  GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Icon(
                                        Icons.close,
                                        size: getSize(24),
                                      ))
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                padding:
                                    getPadding(left: 20, right: 20, bottom: 24),
                                shrinkWrap: true,
                                itemCount: AppListData.numOfMeal.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.numberOfMeal =
                                          AppListData.numOfMeal[index];
                                      controller.update();
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: getPadding(top: 16),
                                      child: Text(
                                        AppListData.numOfMeal[index],
                                        style:
                                            theme.textTheme.bodyLarge!.copyWith(
                                          height: 1.56,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SelectData(
                selectData: controller.numberOfMeal.isEmpty
                    ? 'Number of meals'
                    : controller.numberOfMeal,
                fontColor: controller.numberOfMeal.isEmpty
                    ? AppColor.grey400
                    : AppColor.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getHorizontalSize(24)),
                              topRight:
                                  Radius.circular(getHorizontalSize(24)))),
                      child: Padding(
                        padding: getPadding(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: getPadding(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Select month',
                                    style: theme.textTheme.titleLarge,
                                  )),
                                  GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Icon(
                                        Icons.close,
                                        size: getSize(24),
                                      ))
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                padding:
                                    getPadding(left: 20, right: 20, bottom: 24),
                                shrinkWrap: true,
                                itemCount: AppListData.selectMonth.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.selectMonth =
                                          AppListData.selectMonth[index];
                                      controller.update();
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: getPadding(top: 16),
                                      child: Text(
                                        AppListData.selectMonth[index],
                                        style:
                                            theme.textTheme.bodyLarge!.copyWith(
                                          height: 1.56,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SelectData(
                selectData: controller.selectMonth.isEmpty
                    ? 'Select month'
                    : controller.selectMonth,
                fontColor: controller.selectMonth.isEmpty
                    ? AppColor.grey400
                    : AppColor.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getHorizontalSize(24)),
                              topRight:
                                  Radius.circular(getHorizontalSize(24)))),
                      child: Padding(
                        padding: getPadding(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: getPadding(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Number of snacks',
                                    style: theme.textTheme.titleLarge,
                                  )),
                                  GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Icon(
                                        Icons.close,
                                        size: getSize(24),
                                      ))
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                padding:
                                    getPadding(left: 20, right: 20, bottom: 24),
                                shrinkWrap: true,
                                itemCount: AppListData.numOfSnaks.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.numOfSnacks =
                                          AppListData.numOfSnaks[index];
                                      controller.update();
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: getPadding(top: 16),
                                      child: Text(
                                        AppListData.numOfSnaks[index],
                                        style:
                                            theme.textTheme.bodyLarge!.copyWith(
                                          height: 1.56,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SelectData(
                selectData: controller.numOfSnacks.isEmpty
                    ? 'Number of snacks'
                    : controller.numOfSnacks,
                fontColor: controller.numOfSnacks.isEmpty
                    ? AppColor.grey400
                    : AppColor.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getHorizontalSize(24)),
                              topRight:
                                  Radius.circular(getHorizontalSize(24)))),
                      child: Padding(
                        padding: getPadding(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: getPadding(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Number of weeks',
                                    style: theme.textTheme.titleLarge,
                                  )),
                                  GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Icon(
                                        Icons.close,
                                        size: getSize(24),
                                      ))
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                padding:
                                    getPadding(left: 20, right: 20, bottom: 24),
                                shrinkWrap: true,
                                itemCount: AppListData.numOfWeek.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.numOfWeeks =
                                          AppListData.numOfWeek[index];
                                      controller.update();
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: getPadding(top: 16),
                                      child: Text(
                                        AppListData.numOfWeek[index],
                                        style:
                                            theme.textTheme.bodyLarge!.copyWith(
                                          height: 1.56,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SelectData(
                selectData: controller.numOfWeeks.isEmpty
                    ? 'Number of weeks'
                    : controller.numOfWeeks,
                fontColor: controller.numOfWeeks.isEmpty
                    ? AppColor.grey400
                    : AppColor.black,
              ),
            ),
          ],
        );
      },
      init: ChooseYourPlanStandardOneController(),
    );
  }
}
