import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'controller/move_days_controller.dart';

// ignore: must_be_immutable
class MoveDaysScreen extends GetWidget<MoveDaysController> {
   MoveDaysScreen({Key? key}) : super(key: key);

  List<DateTime> selectedDates = [];


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 AppBarText(
                  onTap: () => Get.back(),
                  title: 'Move days',
                 ),
                  Padding(
                    padding:getPadding(left: 20,top: 16),
                    child: Text("msg_60_lunch_dinner".tr,
                        style: CustomTextStyles.bodyLargeOnError_1),
                  ),

                  Container(
                    margin: getMargin(left: 16,right: 16),
                    padding: EdgeInsets.zero,

                    child: SfDateRangePicker(

                      initialDisplayDate: DateTime(2023,9,17),


                      headerHeight: getSize(70),

                      initialSelectedRanges: [
                       PickerDateRange(DateTime(2023,9,15), DateTime(2023,9,23))
                      ],
                      // allowViewNavigation: true,
                      // backgroundColor: Colors.red,
                      endRangeSelectionColor: AppColor.primaryColor,
                      monthViewSettings:  DateRangePickerMonthViewSettings(

                        // enableSwipeSelection: true,


                        // dayFormat: 'EE',
                        // showTrailingAndLeadingDates: true,
                        viewHeaderStyle: DateRangePickerViewHeaderStyle(




                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSize(16),
                            fontWeight: FontWeight.w400
                          ),


                        ),

                      ),
                      selectionTextStyle: TextStyle(
                          color: AppColor.white,
                          fontSize: getFontSize(18),
                          fontWeight: FontWeight.w700
                      ),
                      view: DateRangePickerView.month,
                      selectionMode: DateRangePickerSelectionMode.multiRange,
                      navigationMode: DateRangePickerNavigationMode.none,
                      showTodayButton: false,
                      todayHighlightColor: Colors.transparent,
                      initialSelectedDate: DateTime(2023,9,17),
                      // initialDisplayDate: DateTime(23,9,14),
                      yearCellStyle: DateRangePickerYearCellStyle(
                        textStyle: TextStyle(
                          color: Colors.black
                        ),
                          leadingDatesTextStyle: TextStyle(
                            color: Colors.red
                          ),
                          disabledDatesTextStyle: TextStyle(
                              color: AppColor.black,
                              fontSize: getFontSize(32),
                              fontWeight: FontWeight.w400
                          ),
                          todayTextStyle: TextStyle(
                              color: AppColor.black,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(22)
                          )
                      ),
                      monthCellStyle:
                      DateRangePickerMonthCellStyle(

                        todayTextStyle:TextStyle(
                            color:AppColor.grey400,
                            fontSize: getFontSize(18),
                            fontWeight: FontWeight.w700
                        ) ,
                        blackoutDateTextStyle: TextStyle(
                          color: Colors.red
                        ),
                        textStyle:TextStyle(
                          color: AppColor.grey400,
                          fontSize: getFontSize(18),
                          fontWeight: FontWeight.w700
                        ),

                      ),
                      enablePastDates: true,

                      rangeTextStyle: TextStyle(
                          color:AppColor.grey400,
                          fontSize: getFontSize(18),
                          fontWeight: FontWeight.w700
                      ),


                      onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                        return  print(dateRangePickerSelectionChangedArgs.value);

                      },
                      // backgroundColor: Colors.white,

                      headerStyle: DateRangePickerHeaderStyle(

                        textStyle: TextStyle(
                            color:AppColor.black,
                            fontWeight: FontWeight.w600,
                            fontSize: getFontSize(20)
                        ),


                      ),

                      initialSelectedDates: [
                        DateTime(2023, 9, 17), // July 17, 2023
                        DateTime(2023, 9, 18),
                      ],


                      showNavigationArrow: true,
                      selectionColor: AppColor.black,

                      rangeSelectionColor: AppColor.grey200,
                    ),
                  ),
                  Padding(
                      padding: getPadding(top: 35,left: 20,right: 20),
                      child: Row(children: [
                        Container(
                            height: getSize(24),
                            width: getSize(24),
                            decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(12)))),
                        Padding(
                            padding: getPadding(left: 8, top: 3),
                            child: Text("msg_current_subscription".tr,
                                style: theme.textTheme.bodyLarge))
                      ])),
                  Padding(
                      padding: getPadding(top: 17, left: 20,right: 20),
                      child: Row(children: [
                        Container(
                            height: getSize(24),
                            width: getSize(24),
                            decoration: BoxDecoration(
                                color: appTheme.red70001,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(12)))),
                        Padding(
                            padding: getPadding(left: 8, top: 3),
                            child: Text("lbl_moved_days".tr,
                                style: theme.textTheme.bodyLarge))
                      ]
                      )
                  ),
                ]
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_move_day".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapMoveday();
            }));
  }


  onTapMovedays() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }


  onTapMoveday() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }
}
