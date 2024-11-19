
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/utils/size_utils.dart';

import '../theme/theme_helper.dart';

class CustomTextFormField extends StatelessWidget {
    CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.enabled,
    this.onTaped,
    this.error,
  }) : super(
    key: key,
  );

  final Alignment? alignment;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final String? error;
  final bool? enabled;
  final Function? onTaped;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null ? textFormFieldWidget : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Padding(
    padding: getPadding(left: 20,right: 20),
    child: TextFormField(
      onTap: () {
        // onTaped!();
      },
      onChanged: (value) {},
      enabled: enabled,
      controller: controller,
      autofocus: autofocus ?? false,
      style: textStyle ??
          TextStyle(
              color: Color(0xFF7C7C7C),
              fontWeight: FontWeight.w400,
              fontSize: getFontSize(16)),
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
      textAlignVertical: TextAlignVertical.center,
    ),
  );

  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ??
        TextStyle(
          color: Color(0xFF7C7C7C),
          fontSize: getFontSize(16),
          fontWeight: FontWeight.w400,
        ),
    errorText: error,
    errorStyle: TextStyle(
      color: Colors.red,
      fontSize: getFontSize(16),
      fontWeight: FontWeight.w400,
    ),
    prefix: prefix??SizedBox(width: getSize(16),),
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    // constraints: BoxConstraints(
    //   minWidth: getSize(25),
    //   maxHeight: getSize(60),
    // ),
    contentPadding: contentPadding ??
        getPadding(
          // left: 16,
          top: 17,
          right: 16,
          bottom: 18,
        ),
    fillColor: fillColor ?? Color(0xFFF9F9F9),
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              16,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: getSize(1),
          ),
        ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        getHorizontalSize(
          16,
        ),
      ),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: getSize(1),
      ),
    ),

    focusedBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              16.00,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: getSize(1),
          ),
        ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        getHorizontalSize(
          16.00,
        ),
      ),
      borderSide: BorderSide(
        color: appTheme.red100,
        width: getSize(1),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        getHorizontalSize(
          16.00,
        ),
      ),
      borderSide: BorderSide(
        color: appTheme.red700,
        width: getSize(1),
      ),
    ),
  );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillGray => OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      getHorizontalSize(
        12.00,
      ),
    ),
    borderSide: BorderSide.none,
  );

  static OutlineInputBorder get outlineBlueGrayTL12 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      getHorizontalSize(
        12.00,
      ),
    ),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 1,
    ),
  );

  static OutlineInputBorder get fillWhiteA => OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      getHorizontalSize(
        12.00,
      ),
    ),
    borderSide: BorderSide.none,
  );

  static OutlineInputBorder get fillGrayTL16 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      getHorizontalSize(
        16.00,
      ),
    ),
    borderSide: BorderSide.none,
  );
}
