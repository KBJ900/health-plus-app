import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/utils/size_utils.dart';

import '../../../theme/theme_helper.dart';

class MyProfileOpe extends StatelessWidget {
  final String? title;
  final String? personInfo;
  const MyProfileOpe({this.title, this.personInfo});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: getPadding(top: 10,bottom: 10,left: 16,right: 16),
      margin: getMargin(left: 20,right: 20,bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.grey100,
        borderRadius: BorderRadius.circular(getHorizontalSize(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title??'First name',style: TextStyle(
            color:  AppColor.grey400,
            fontWeight: FontWeight.w400,
            fontSize: getFontSize(16),
          ),),
          Padding(
            padding:getPadding(top: 10),
            child: Text(personInfo??'John',style: theme.textTheme.bodyLarge!.copyWith(height: 1.56)),
          ),
        ],
      ),
    );
  }
}
