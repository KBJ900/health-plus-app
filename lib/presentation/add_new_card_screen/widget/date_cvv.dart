import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:diet_recipe_app/core/app_export.dart';



class DateCvv extends StatefulWidget {
  final String? name;
  const DateCvv({ this.name});

  @override
  State<DateCvv> createState() => _DateCvvState();
}

class _DateCvvState extends State<DateCvv> {
  TextEditingController dateInput = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return  Row(
      children: [
        Expanded(
          child: GestureDetector(

            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate:DateTime(2000),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                            primary: AppColor.primaryColor, // <-- SEE HERE
                            onPrimary: AppColor.white,// <-- SEE HERE
                            onSurface: AppColor.black // <-- SEE HERE
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            iconColor:  Colors.red,
                            // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                  lastDate: DateTime(2101)
              );
              if(pickedDate != null ){
                print(pickedDate);
                String formattedDate = DateFormat('MM/yy').format(pickedDate);
                print(formattedDate);

                setState(() {
                  dateInput.text = formattedDate; //set output date to TextField value.
                });
              }else{
                print("Date is not selected");
              }
              debugPrint(dateInput.text);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              width: getSize(50),
              height: getSize(56),decoration: BoxDecoration(
                color:AppColor.grey100,
                borderRadius: BorderRadius.circular(getHorizontalSize(16)),

            ),
              child: Padding(
                padding:  getPadding(left: 20),
                child: dateInput.text.isEmpty ? Text('Expiry Date',style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: getFontSize(16),
                  color:AppColor.grey400,
                ),):Text(dateInput.text,style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: getFontSize(16),
                  color:AppColor.black,
                ),),
              ),

            ),
          ),
        ),

        SizedBox(
          width:getSize(16),
        ),
        Expanded(
          child: TextField(
            // maxLines:,
            style: TextStyle(
              color:AppColor.black,
              fontWeight: FontWeight.w400,
              fontSize: getFontSize(16),
            ),
            obscureText: true,
            // obscuringCharacter: '*',

            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            textAlignVertical: TextAlignVertical.center,

            decoration: InputDecoration(
              contentPadding: getPadding(
                left: 16,
                top: 17,
                right: 16,
                bottom: 18,
                ),
              // enabled: true,
              border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(getHorizontalSize(16)),
                  borderSide:  BorderSide(
                    color:Colors.transparent  ,
                  )

              ),
              focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                  borderSide:  BorderSide(
                    color:Colors.transparent  ,
                  )
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(getHorizontalSize(16)),
                  borderSide: const BorderSide(
                    color:Colors.transparent  ,
                  )
              ),
              enabledBorder:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(getHorizontalSize(16)),
                  borderSide:  BorderSide(
                    color:Colors.transparent  ,
                  )
              ) ,
              disabledBorder:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(getHorizontalSize(16)),
                  borderSide:  BorderSide(
                    color:Colors.transparent  ,
                  )
              ) ,


              filled: true,
              hintStyle:  TextStyle(fontWeight: FontWeight.w400,
                  fontSize: getFontSize(16),
                  color: AppColor.grey400),
              hintText: "CVV",
              fillColor:AppColor.grey100),

          ),
        ),
      ],
    );
  }
}
