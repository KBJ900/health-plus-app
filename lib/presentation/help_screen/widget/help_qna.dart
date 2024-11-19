import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/help_screen/controller/help_controller.dart';
import '../../../generated/assets.dart';


class HelpQna extends StatelessWidget {
  final String? question;
  final String? ans;
  const HelpQna({ this.question, this.ans});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpController>(builder: (controller) {
      return ListView(
        children: [
            Padding(
              padding: getPadding(left: 20,right: 20,bottom: 16),
                 child: Theme(
                          data: Theme.of(context).copyWith(
                            splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              dividerColor:Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: const EdgeInsets.all(0),
                            tileColor: Colors.transparent,
                            dense: true,
                              child: Container(

                                decoration: BoxDecoration(
                                      color: AppColor.grey100,
                                      borderRadius: BorderRadius.circular(getHorizontalSize(16)),

                                    ),
                                child: Padding(
                                    padding:  getPadding(left: 16,right: 16,top: 6,bottom: 6),
                                    child: ExpansionTile(
                                           // clipBehavior: Clip.antiAlias,

                                           // childrenPadding: EdgeInsets.symmetric(horizontal: 15.h),
                                           backgroundColor:Colors.transparent,
                                           onExpansionChanged: (bool expanded) {
                                           controller.tileExpanded = expanded;
                                           controller.update();
                                        },
                                        trailing: CustomImageView(
                                        svgPath:controller.tileExpanded
                                        ?Assets.imagesImgArrowup: Assets.imagesImgArrowdownBlack900,height: getSize(24),color:AppColor.black ,
                                        ),



                                         controlAffinity: ListTileControlAffinity.trailing,
                                         title: Text(question!,style: TextStyle(
                                               color:AppColor.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize:getFontSize(18),
                                         ),textAlign: TextAlign.start,),

                                         collapsedBackgroundColor:AppColor.grey100,
                                         collapsedTextColor: AppColor.grey100,
                                         collapsedIconColor: AppColor.grey100,
                                         children: [

                                      Padding(
                                        padding: getPadding(bottom: 10),
                                          child: Text(ans??'Balanced diet contains all of the essential elements'
                                              ' that the human body needs. Carbohydrates, lipids, vitamins, '
                                              'minerals, proteins, fiber, and water',style: theme.textTheme.bodyLarge,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
              ),
            Padding(
              padding: getPadding(left: 20,right: 20,bottom: 16),
                 child: Theme(
                          data: Theme.of(context).copyWith(
                              dividerColor:Colors.transparent,
                            shadowColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,),
                          child: ListTileTheme(
                            contentPadding: const EdgeInsets.all(0),
                            tileColor: Colors.transparent,
                            dense: true,
                              child: Container(

                                decoration: BoxDecoration(
                                      color: AppColor.grey100,
                                      borderRadius: BorderRadius.circular(getHorizontalSize(16)),

                                    ),
                                child: Padding(
                                    padding:  getPadding(left: 16,right: 16,top: 6,bottom: 6),
                                    child: ExpansionTile(
                                           // clipBehavior: Clip.antiAlias,

                                           // childrenPadding: EdgeInsets.symmetric(horizontal: 15.h),
                                           backgroundColor:Colors.transparent,
                                           onExpansionChanged: (bool expanded) {
                                           controller.tillTwo = expanded;
                                           controller.update();
                                        },
                                        trailing: CustomImageView(
                                        svgPath:controller.tillTwo
                                        ?Assets.imagesImgArrowup: Assets.imagesImgArrowdownBlack900,height: getSize(24),color:AppColor.black ,
                                        ),



                                         controlAffinity: ListTileControlAffinity.trailing,
                                         title: Text('How many times to eat a day?',style: TextStyle(
                                               color:AppColor.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize:getFontSize(18),
                                         ),textAlign: TextAlign.start,),

                                         collapsedBackgroundColor:AppColor.grey100,
                                         collapsedTextColor: AppColor.grey100,
                                         collapsedIconColor: AppColor.grey100,
                                         children: [

                                      Padding(
                                        padding: getPadding(bottom: 10),
                                          child: Text(ans??'Balanced diet contains all of the essential elements'
                                              ' that the human body needs. Carbohydrates, lipids, vitamins, '
                                              'minerals, proteins, fiber, and water',style: theme.textTheme.bodyLarge,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
              ),
            Padding(
              padding: getPadding(left: 20,right: 20,bottom: 16),
                 child: Theme(
                          data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              dividerColor:Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: const EdgeInsets.all(0),
                            tileColor: Colors.transparent,
                            dense: true,
                              child: Container(

                                decoration: BoxDecoration(
                                      color: AppColor.grey100,
                                      borderRadius: BorderRadius.circular(getHorizontalSize(16)),

                                    ),
                                child: Padding(
                                    padding:  getPadding(left: 16,right: 16,top: 6,bottom: 6),
                                    child: ExpansionTile(
                                           // clipBehavior: Clip.antiAlias,

                                           // childrenPadding: EdgeInsets.symmetric(horizontal: 15.h),
                                           backgroundColor:Colors.transparent,
                                           onExpansionChanged: (bool expanded) {
                                           controller.tillThree = expanded;
                                           controller.update();
                                        },
                                        trailing: CustomImageView(
                                        svgPath:controller.tillThree
                                        ?Assets.imagesImgArrowup: Assets.imagesImgArrowdownBlack900,height: getSize(24),color:AppColor.black ,
                                        ),



                                         controlAffinity: ListTileControlAffinity.trailing,
                                         title: Text('What is the time limit diet?',style: TextStyle(
                                               color:AppColor.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize:getFontSize(18),
                                         ),textAlign: TextAlign.start,),

                                         collapsedBackgroundColor:AppColor.grey100,
                                         collapsedTextColor: AppColor.grey100,
                                         collapsedIconColor: AppColor.grey100,
                                         children: [

                                      Padding(
                                        padding: getPadding(bottom: 10),
                                          child: Text(ans??'Balanced diet contains all of the essential elements'
                                              ' that the human body needs. Carbohydrates, lipids, vitamins, '
                                              'minerals, proteins, fiber, and water',style: theme.textTheme.bodyLarge,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
              ),
            Padding(
              padding: getPadding(left: 20,right: 20,bottom: 16),
                 child: Theme(
                          data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              dividerColor:Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: const EdgeInsets.all(0),
                            tileColor: Colors.transparent,
                            dense: true,
                              child: Container(

                                decoration: BoxDecoration(
                                      color: AppColor.grey100,
                                      borderRadius: BorderRadius.circular(getHorizontalSize(16)),

                                    ),
                                child: Padding(
                                    padding:  getPadding(left: 16,right: 16,top: 6,bottom: 6),
                                    child: ExpansionTile(
                                           // clipBehavior: Clip.antiAlias,

                                           // childrenPadding: EdgeInsets.symmetric(horizontal: 15.h),
                                           backgroundColor:Colors.transparent,
                                           onExpansionChanged: (bool expanded) {
                                           controller.tillFour = expanded;
                                           controller.update();
                                        },
                                        trailing: CustomImageView(
                                        svgPath:controller.tillFour
                                        ?Assets.imagesImgArrowup: Assets.imagesImgArrowdownBlack900,height: getSize(24),color:AppColor.black ,
                                        ),



                                         controlAffinity: ListTileControlAffinity.trailing,
                                         title: Text('How to eat better?',style: TextStyle(
                                               color:AppColor.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize:getFontSize(18),
                                         ),textAlign: TextAlign.start,),

                                         collapsedBackgroundColor:AppColor.grey100,
                                         collapsedTextColor: AppColor.grey100,
                                         collapsedIconColor: AppColor.grey100,
                                         children: [

                                      Padding(
                                        padding: getPadding(bottom: 10),
                                          child: Text(ans??'Balanced diet contains all of the essential elements'
                                              ' that the human body needs. Carbohydrates, lipids, vitamins, '
                                              'minerals, proteins, fiber, and water',style: theme.textTheme.bodyLarge,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
              ),
            Padding(
              padding: getPadding(left: 20,right: 20,bottom: 16),
                 child: Theme(
                          data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              dividerColor:Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: const EdgeInsets.all(0),
                            tileColor: Colors.transparent,
                            dense: true,
                              child: Container(

                                decoration: BoxDecoration(
                                      color: AppColor.grey100,
                                      borderRadius: BorderRadius.circular(getHorizontalSize(16)),

                                    ),
                                child: Padding(
                                    padding:  getPadding(left: 16,right: 16,top: 6,bottom: 6),
                                    child: ExpansionTile(
                                           // clipBehavior: Clip.antiAlias,

                                           // childrenPadding: EdgeInsets.symmetric(horizontal: 15.h),
                                           backgroundColor:Colors.transparent,
                                           onExpansionChanged: (bool expanded) {
                                           controller.tillFive = expanded;
                                           controller.update();
                                        },
                                        trailing: CustomImageView(
                                        svgPath:controller.tillFive
                                        ?Assets.imagesImgArrowup: Assets.imagesImgArrowdownBlack900,height: getSize(24),color:AppColor.black ,
                                        ),



                                         controlAffinity: ListTileControlAffinity.trailing,
                                         title: Text('What are the six food groups?',style: TextStyle(
                                               color:AppColor.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize:getFontSize(18),
                                         ),textAlign: TextAlign.start,),

                                         collapsedBackgroundColor:AppColor.grey100,
                                         collapsedTextColor: AppColor.grey100,
                                         collapsedIconColor: AppColor.grey100,
                                         children: [

                                      Padding(
                                        padding: getPadding(bottom: 10),
                                          child: Text(ans??'Balanced diet contains all of the essential elements'
                                              ' that the human body needs. Carbohydrates, lipids, vitamins, '
                                              'minerals, proteins, fiber, and water',style: theme.textTheme.bodyLarge,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
              ),
            Padding(
              padding: getPadding(left: 20,right: 20,bottom: 16),
                 child: ListTileTheme(
                   contentPadding: const EdgeInsets.all(0),
                   tileColor: Colors.transparent,



                   dense: true,
                     child: Container(

                       decoration: BoxDecoration(
                             color: AppColor.grey100,
                             borderRadius: BorderRadius.circular(getHorizontalSize(16)),

                           ),
                       child: Padding(
                           padding:  getPadding(left: 16,right: 16,top: 6,bottom: 6),
                           child: ExpansionTile(
                                  // clipBehavior: Clip.antiAlias,

                                  // childrenPadding: EdgeInsets.symmetric(horizontal: 15.h),
                                  backgroundColor:Colors.transparent,
                                  onExpansionChanged: (bool expanded) {
                                  controller.tillSix = expanded;
                                  controller.update();
                               },
                               trailing: CustomImageView(
                               svgPath:controller.tillSix
                               ?Assets.imagesImgArrowup: Assets.imagesImgArrowdownBlack900,height: getSize(24),color:AppColor.black ,
                               ),



                                controlAffinity: ListTileControlAffinity.trailing,
                                title: Text('What are the best foods to eat?',style: TextStyle(
                                      color:AppColor.black,
                                     fontWeight: FontWeight.w700,
                                     fontSize:getFontSize(18),
                                ),textAlign: TextAlign.start,),

                                collapsedBackgroundColor:AppColor.grey100,
                                collapsedTextColor: AppColor.grey100,
                                collapsedIconColor: AppColor.grey100,
                                children: [

                             Padding(
                               padding: getPadding(bottom: 10),
                                 child: Text(ans??'Balanced diet contains all of the essential elements'
                                     ' that the human body needs. Carbohydrates, lipids, vitamins, '
                                     'minerals, proteins, fiber, and water',style: theme.textTheme.bodyLarge,),
                               )
                             ],
                           ),
                         ),
                       ),
                     ),
              ),
        ],
      );
    },init: HelpController(),);
  }
}
