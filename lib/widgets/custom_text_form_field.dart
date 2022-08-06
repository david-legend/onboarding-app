import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboardingapp/values/values.dart';

class CustomTextFormField extends StatelessWidget {
  final BorderStyle borderStyle;
  final double borderRadius;
  final double borderWidth;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final String hintText;
  final String prefixText;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color fillColor;
  final bool filled;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final int maxLength;
  FormFieldValidator<String>? validator;
  List<TextInputFormatter>? inputFormatters;
  final TextStyle? textFormFieldStyle;
  final TextStyle? hintTextStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  ValueChanged<String>? onChanged;

  CustomTextFormField({
    this.prefixIcon,
    this.suffixIcon,
    this.textFormFieldStyle,
    this.hintTextStyle,
    this.borderStyle = BorderStyle.none,
    this.borderRadius = Sizes.RADIUS_12,
    this.borderWidth = Sizes.WIDTH_0,
    this.contentPaddingHorizontal = Sizes.PADDING_0,
    this.contentPaddingVertical = Sizes.PADDING_12,
    this.hintText ="",
    this.borderColor = AppColors.violetShade1,
    this.focusedBorderColor = AppColors.violetShade1,
    this.enabledBorderColor = AppColors.violetShade1,
    this.fillColor = AppColors.white,
    this.filled = true,
    this.hasPrefixIcon = false,
    this.hasSuffixIcon = false,
    this.obscured = false,
    this.textInputType,
    this.onChanged,
    this.prefixText = "+1",
    this.maxLength = 14,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: textFormFieldStyle,
        keyboardType: textInputType,
        onChanged: onChanged,
        maxLength: maxLength,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
          ),
          prefixText: prefixText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: enabledBorderColor,
              width: borderWidth,
              style: borderStyle,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: focusedBorderColor,
              width: borderWidth,
              style: borderStyle,
            ),
          ),
          prefixIcon: hasPrefixIcon ? prefixIcon : null,
          suffixIcon: hasSuffixIcon ? suffixIcon : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: contentPaddingHorizontal,
            vertical: contentPaddingVertical,
          ),
          hintText: hintText,
          hintStyle: hintTextStyle,
          filled: filled,
          fillColor: fillColor,
        ),
        obscureText: obscured,
      ),
    );
  }
}
