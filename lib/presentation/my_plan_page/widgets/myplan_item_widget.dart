import '../controller/my_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class MyPlanItemWidget extends StatelessWidget {
  final String? planName;
  final String? date;
  final bool isPending;
  MyPlanItemWidget(
   {
    Key? key,
    this.onTapMyplan, this.planName, this.date, required this.isPending,
  }) : super(
          key: key,
        );



  var controller = Get.find<MyPlanController>();

  VoidCallback? onTapMyplan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapMyplan?.call();
      },
      child: Container(
        margin: getMargin(top: 16,left: 20,right: 20),
        padding: getPadding(all: 16),
        decoration: BoxDecoration(
          color: AppColor.grey100,
          borderRadius: BorderRadius.circular(getHorizontalSize(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planName??'Make a grocery',style: theme.textTheme.titleMedium,),
                  Padding(
                    padding: getPadding(top: 4),
                    child: Text('Date :$date',style: theme.textTheme.bodyLarge?.copyWith(height: 1.56),),
                  ),
                ],
              ),
            ),
            Container(

              padding: getPadding(left: 14,right: 14,top: 3,bottom: 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                
              ),
              child: Text('Ver Plan',style: TextStyle(
                  fontSize: getFontSize(14),
                  fontWeight: FontWeight.w500,
                  color:isPending?Color(0xFFC98400):AppColor.success,
              ),),
            ),


          ],
        ),
      ),
    );
  }
}
