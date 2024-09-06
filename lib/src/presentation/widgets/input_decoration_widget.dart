import 'package:adhoc/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecoration(
  BuildContext context, {
  String? hintText,
  bool? filled = false,
  Widget? prefix,
  Widget? suffix,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double? verticalPadding,
  TextStyle? hintStyle,
  Color borderColor = AppColors.white,
  Color? fillColor,
  String? labelText,
  FontWeight? hintFontWeight,
}) {
  return InputDecoration(
    prefix: prefix,
    suffix: suffix,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    hintStyle: hintStyle ??
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.hintText,
              fontWeight: hintFontWeight ?? FontWeight.w500,
            ),
    fillColor: fillColor,
    filled: filled,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: verticalPadding ?? 0,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 0.85,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 0.85,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 0.85,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    hintText: hintText,
    labelText: labelText,
    labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.hintText,
          fontWeight: FontWeight.w500,
        ),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelStyle: const TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.w500,
    ),
  );
}

InputDecorationTheme dropDownDecoration() {
  return const InputDecorationTheme(
    hintStyle: TextStyle(
      color: AppColors.grey,
      fontWeight: FontWeight.w100,
    ),
    fillColor: AppColors.grey,
    filled: true,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 0,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey, width: 0.85),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey, width: 0.85),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey, width: 0.85),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}
