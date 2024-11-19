



import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../presentation/add_menu_tab_container_screen/models/add_menu_tab_container_model.dart';
import '../../presentation/menu_page/models/ourmenu_item_model.dart';
import '../../presentation/my_cart_screen/models/my_cart_model.dart';
import '../../presentation/my_plan_page/models/myplan_item_model.dart';
import '../../presentation/notifications_screen/models/notifications_model.dart';
import '../../presentation/onboarding_four_screen/models/onboarding_four_model.dart';
import '../../presentation/premium_screen/models/subscriptionpla_item_model.dart';
import '../../presentation/recommendations_screen/models/recommendations_model.dart';
import '../../presentation/what_for_lunch_screen/models/what_for_lunch_model.dart';

class AppListData{

  static List<OnboardingFourModel> onboardingList =[

    OnboardingFourModel(
      img: ImageConstant.imgWhiteplatewit,
      title: 'Deliicious food',
      details: 'Arguably South India s most renowned culinary export, masala dosas are famous the world over'
    ),
    OnboardingFourModel(
      img: ImageConstant.imgSchezwannoodle,
      title: 'Healthy & testy',
      details: 'Emami agrotech produces vegetable oil, sunflower  Healthy & Tasty and Himani Best Choice.'
    ),
    OnboardingFourModel(
      img: ImageConstant.onThree,
      title: 'Let’ eat...',
      details: 'The warmth and love of family provides comfort and closeness unconditional love for one another.'
    ),

  ];


  static List<WhatForLunchModel> lunchList =[

    WhatForLunchModel(
      id: 0,
      img: ImageConstant.wLunch1,
      name: 'Pencage blues',
      time: '30 Mins',
      kcal: '21 Kcal',
    ),
    WhatForLunchModel(
      id: 1,
      img: ImageConstant.wLunch2,
      name: 'Indian patisserie',
      time: '20 Mins',
      kcal: '154 Kcal',
    ),
    WhatForLunchModel(
      id: 2,
      img: ImageConstant.wLunch3,
      name: 'Delicious meat',
      time: '14 Mins',
      kcal: '65 Kcal',
    ),
    WhatForLunchModel(
      id: 3,
      img: ImageConstant.wLunch4,
      name: 'Spices garlics tom..',
      time: '16 Mins',
      kcal: '48 Kcal',
    ),
    WhatForLunchModel(
      id: 4,
      img: ImageConstant.wLunch5,
      name: 'Black plate cutlery',
      time: '10 Mins',
      kcal: '17 Kcal',
    ),
    WhatForLunchModel(
      id: 5,
      img: ImageConstant.wLunch6,
      name: 'Panzanella salad',
      time: '50 Mins',
      kcal: '18 Kcal',
    ),

  ];

  static List<RecommendationsModel> recommendationsList =[
    RecommendationsModel(
      img: ImageConstant.imgR1,
      name: 'Salmon with mixed salad',
      backColor: Color(0xFFCAE3F1),
    ),
    RecommendationsModel(
      img: ImageConstant.imgR2,
      name: 'Chicken Crisp papadum',
      backColor: Color(0xFFF4D1D0),
    ),
    RecommendationsModel(
      img: ImageConstant.imgR3,
      name: 'Sausage, bacon, tomatoes',
      backColor: Color(0xFFF4EAD0),
    ),
    RecommendationsModel(
      img: ImageConstant.imgR4,
      name: 'Fresh tomato and radish',
      backColor: Color(0xFFD9F4D0),
    ),
    RecommendationsModel(
      img: ImageConstant.imgR5,
      name: 'Dumplings brown Satsna',
      backColor: Color(0xFFD0DAF4),
    ),
    RecommendationsModel(
      img: ImageConstant.imgR6,
      name: 'Mushrooms bok choy',
      backColor: Color(0xFFF1D0F4),
    ),
    RecommendationsModel(
      img: ImageConstant.imgR7,
      name: 'Salmon with mixed salad',
      backColor: Color(0xFFD0F4EE),
    ),
    RecommendationsModel(
      img: ImageConstant.imgR8,
      name: 'Chicken Crisp papadum ',
      backColor: Color(0xFFF4EAD0),
    ),


  ];

  static List<AddMenuTabContainerModel> addMenuList =[
    AddMenuTabContainerModel(
        img: ImageConstant.imgRectangle4401,
      name: 'Fresh green salad',
      protein: '35g',
      fat: '18g',
      carb: '14g',
      categories: '350',
    ),
    AddMenuTabContainerModel(
      img: ImageConstant.imgRectangle44014,

      name: 'Buffer crep',
      protein: '35g',
      fat: '18g',
      carb: '14g',
      categories: '350',
    ),
    AddMenuTabContainerModel(
      img: ImageConstant.imgRectangle44011,

      name: 'Green salad',
      protein: '35g',
      fat: '18g',
      carb: '14g',
      categories: '350',
    ),
    AddMenuTabContainerModel(
      img: ImageConstant.imgRectangle44012,

      name: 'Chicken biryani',
      protein: '35g',
      fat: '18g',
      carb: '14g',
      categories: '350',
    ),
    AddMenuTabContainerModel(
      img: ImageConstant.menu4,
      name: 'Washington',
      protein: '35g',
      fat: '18g',
      carb: '14g',
      categories: '350',
    ),


  ];
  static List<OurMenuItemModel> getOurMenu(){
    return [
      OurMenuItemModel(
        id: 0,
        img: ImageConstant.oM1,
        name: 'Fresh green salad',
        price: 14.00,
        protein: '35g',
        fat: '18g',
        carb: '14g',
        categories: '350',
      ),
      OurMenuItemModel(
        id: 1,
        price: 12.00,
        img: ImageConstant.oM2,

        name: 'Chicken biryani',
        protein: '35g',
        fat: '18g',
        carb: '14g',
        categories: '350',
      ),
      OurMenuItemModel(
        id: 2,
        price: 11.00,
        img: ImageConstant.oM3,

        name: 'Buffer crep',
        protein: '35g',
        fat: '18g',
        carb: '14g',
        categories: '350',
      ),
      OurMenuItemModel(
        id: 3,
        price: 12.00,
        img: ImageConstant.oM4,

        name: 'Honey crap',
        protein: '35g',
        fat: '18g',
        carb: '14g',
        categories: '350',
      ),
      OurMenuItemModel(
        id: 4,
        price: 12.00,
        img: ImageConstant.oM5,
        name: 'Green salad',
        protein: '35g',
        fat: '18g',
        carb: '14g',
        categories: '350',
      ),
    ];
  }

  static List<NotificationsModel> notificationList =[
    NotificationsModel(
      message: 'Candidates wishing postgraduate in diet and nutrition',
      time: '5 min',
    ),
    NotificationsModel(
      message: 'They must acquire a minimum of 45 per cent of marks',
      time: '10 min',
    ),
    NotificationsModel(
      message: 'Course to further pursue an msc or the postgraduate',
      time: '15 min',
    ),
    NotificationsModel(
      message: 'Educational or its equivalent with 50% marks',
      time: '20 min',
    ),
    NotificationsModel(
      message: 'Both courses are specially designed for Elementary Teacher',
      time: '25 min',
    ),
    NotificationsModel(
      message: 'Training programme of or around 50 students for admission',
      time: '30 min',

    ),
    NotificationsModel(

      message: 'Shall be approved by NCTE in due course of time.',
      time: '40 min',

    ),
    NotificationsModel(
      message: 'Worldwide recognised course that provides complete',
      time:  '50 min',
    ),

  ];

  static List<String> planDuration = [
    '1 Week',
    '1 Month',
  ];

  static List<String> daysPerWeek =[
    '5 Days',
    '6 Days',
    '7 Days',
  ];


  static List<String> selectMonth =[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static List<String> numOfMeal =[
    '1 Meals',
    '2 Meals',
    '3 Meals',
    '4 Meals',
    '5 Meals',
  ];

  static List<String> numOfSnaks =  [
    '1 Snacks',
    '2 Snacks',
    '3 Snacks',
    '4 Snacks',
    '5 Snacks',
  ];

  static List<String> numOfWeek =[
    '1 Weeks',
    '2 Weeks',
    '3 Weeks',
    '4 Weeks',
    '5 Weeks',
  ];

  static List<MyPlanItemModel> myPlanList =[
    MyPlanItemModel(
      name: 'Make a grocery',
      date: '12 Aug to 1 Sep',
      isPending: true,
    ),
    MyPlanItemModel(
      name: 'Low-carbohydrate plan',
      date: '02 Jan to 01 Feb',
      isPending: false,
    ),
    MyPlanItemModel(
      name: 'Vegetarian',
      date: '05 Feb to 14 Mar',
      isPending: false,
    ),
    MyPlanItemModel(
      name: 'An experimental diet',
      date: '08 Aug to 18 Sep',
      isPending: false,
    ),
    MyPlanItemModel(
      name: 'Beverages',
      date: '17 Aug to 14 Sep',
      isPending: false,
    ),
    MyPlanItemModel(
      name: 'Course dinner menu',
      date: '15 May to 17 Jul',
      isPending: false,
    ),

  ];

  static List<SubscriptionPlaItemModel> premiumPlanList =[


    SubscriptionPlaItemModel(
      title: '3 Month',
      disc: 'Renews after every 3 months',
      price: '50.00'
    ),
    SubscriptionPlaItemModel(
        title: '6 Month',
        disc: 'Renews after every 6 months',
        price: '100.00'
    ),
    SubscriptionPlaItemModel(
        title: '12 Month',
        disc: 'Renews after every 12 months',
        price: '150.00'
    ),
    SubscriptionPlaItemModel(
        title: 'Life time',
        disc: 'One time payment only',
        price: '200.00'
    ),

  ];

  static List<MyCartModel> myCartList =[
    MyCartModel(
      img: ImageConstant.oM2,
      name: 'Chicken biryani',
      food: 'Rice',
        price:'12.00'
    ),
    MyCartModel(
      img: ImageConstant.oM1,
        name: 'Fresh green salad',
        food: 'Buffer',
        price:'14.00'
    ),
    MyCartModel(
      img: ImageConstant.oM4,
        name: 'Honey crap',
        food: 'Protein',
        price:'18.00'
    ),
    MyCartModel(
      img: ImageConstant.oM5,
        name: 'Green salad',
        food: 'Rice',
        price:'17.00'
    )


  ];
}