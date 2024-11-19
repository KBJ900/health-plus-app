import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/choose_your_plan_standard_one_page/controller/choose_your_plan_standard_one_controller.dart';

import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'controller/select_date_controller.dart';

// ignore: must_be_immutable
class SelectDateScreen extends GetWidget<SelectDateController> {
   SelectDateScreen({Key? key}) : super(key: key);

   ChooseYourPlanStandardOneController chooseYourPlanStandardOneController = Get.put(ChooseYourPlanStandardOneController());


  String selectedDateText = '';
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
                title: 'Select date',
               ),
               GetBuilder<SelectDateController>(builder: (controller) {
                 return Container(
                   margin:getMargin(left: 20,right: 20),
                   child: SfDateRangePicker(



                     headerHeight: getSize(70),
                     // initialSelectedRanges: [
                     //  PickerDateRange(DateTime(2023,9,15), DateTime(2023,9,23))
                     // ],
                     // allowViewNavigation: true,
                     // backgroundColor: Colors.red,
                     endRangeSelectionColor: AppColor.primaryColor,
                     monthViewSettings:  DateRangePickerMonthViewSettings(
                       // enableSwipeSelection: true,
                         dayFormat: 'EEE',
                         weekNumberStyle: DateRangePickerWeekNumberStyle(
                             textStyle: TextStyle(
                                 color: AppColor.black,
                                 fontSize: getFontSize(16),
                                 fontWeight: FontWeight.w400
                             )

                         ),
                         viewHeaderStyle: DateRangePickerViewHeaderStyle(
                           textStyle: TextStyle(
                               color: Colors.black,
                               fontSize: getFontSize(16),
                               fontWeight: FontWeight.w400
                           ),
                         )
                     ),
                     selectionTextStyle: TextStyle(
                         color: AppColor.white,
                         fontSize: getFontSize(18),
                         fontWeight: FontWeight.w700
                     ),

                     view: DateRangePickerView.month,
                     selectionMode: DateRangePickerSelectionMode.single,
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
                       todayTextStyle: TextStyle(
                           color:AppColor.grey400,
                           fontWeight: FontWeight.w700
                       ),
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

                     onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                       final selectedDate = args.value;
                       if (selectedDate != null) {

                         // Format the selected date as per your preference

                         if(chooseYourPlanStandardOneController.isStart){
                           controller.data = DateFormat('dd MMM').format(selectedDate, );
                           chooseYourPlanStandardOneController.selectStartDate = controller.data!;
                           print('starrt Date--->${chooseYourPlanStandardOneController.selectStartDate}');
                           chooseYourPlanStandardOneController.update();
                           chooseYourPlanStandardOneController.isStart =false;

                           controller.update();
                         }
                         else if(chooseYourPlanStandardOneController.isEnd){
                           controller.endDate = DateFormat('dd MMM').format(selectedDate);
                           chooseYourPlanStandardOneController.selectEndDate = controller.endDate!;
                           print('end Date--->${chooseYourPlanStandardOneController.selectEndDate}');
                           chooseYourPlanStandardOneController.update();
                           chooseYourPlanStandardOneController.isEnd = false;
                           controller.update();

                         }else{
                           controller.selectedDate =
                               DateFormat('dd/MM/yyyy').format(selectedDate);
                           controller.update();
                           controller.selectedDate = controller.selectedDate;
                         }




                         // print('szkbjikas--->${controller.data}');



                       }
                     },

                     // backgroundColor: Colors.white,

                     headerStyle: DateRangePickerHeaderStyle(

                       textStyle: TextStyle(
                           color:AppColor.black,
                           fontWeight: FontWeight.w600,
                           fontSize: getFontSize(20)
                       ),



                     ),

                     // initialSelectedDates: [
                     //  DateTime(2023, 9, 17), // July 17, 2023
                     //  DateTime(2023, 9, 18),
                     // ],


                     showNavigationArrow: true,
                     selectionColor: AppColor.primaryColor,

                     rangeSelectionColor: AppColor.grey200,

                   ),
                 );
               },init: SelectDateController(),),
              ]),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_ok2".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              // chooseYourPlanStandardOneController.isStart = false;
              // chooseYourPlanStandardOneController.isEnd=false;
              Get.back();
            }));
  }

  /// Navigates to the changeDeliveryAddressScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the changeDeliveryAddressScreen.
  onTapSelectdate() {
    Get.toNamed(
      AppRoutes.changeDeliveryAddressScreen,
    );
  }

  /// Navigates to the changeDeliveryAddressScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the changeDeliveryAddressScreen.
  onTapOk() {
    Get.toNamed(
      AppRoutes.changeDeliveryAddressScreen,
    );
  }
}
