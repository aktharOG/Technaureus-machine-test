import 'package:flutter/services.dart';

import '../../../exports_main.dart';
import 'custom_text.dart';

class CustomTextfield extends StatelessWidget {
  final bool showCountryCode;
  final String name;
  final TextEditingController controller;
  final Widget? leading;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final BoxBorder? border;
  final int? maxLines;
  final double? height;
  final TextInputAction? textInputAction;
  final double? fontSize;
  final double? hintFontSize;
  final Color? hintForegroundColor;
  final TextInputType? keyboardType;
  // final double? cursorHeight;
  final Widget? suffixIcon;
  final FontWeight? fw;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final BorderRadius? borderRadius;
  final String? errorText;

  const CustomTextfield({
    super.key,
    this.showCountryCode = false,
    required this.controller,
    required this.name,
    this.leading,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.foregroundColor,
    this.backgroundColor,
    this.border,
    this.maxLines = 1,
    this.height,
    this.textInputAction,
    this.fontSize,
    this.hintFontSize,
    this.hintForegroundColor,
    // this.cursorHeight,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.fw,
    this.borderRadius,
    this.keyboardType,
    this.onFieldSubmitted,
    this.contentPadding,
    this.errorText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.eyeBackground,
          border: border,
          borderRadius: borderRadius,),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          if (leading != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: leading!,
            ),
          if (showCountryCode) const SizedBox(width: 10),
          if (showCountryCode)
            const CustomText(
              name: "🇮🇳 +91",
              fontsize: 18,
            ),
          // if (showCountryCode)
          //   const Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 5.0),
          //     child: VerticalDivider(),
          //   ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                onFieldSubmitted: onFieldSubmitted,
                textInputAction: textInputAction,
                maxLines: maxLines,
                focusNode: focusNode,
                inputFormatters: inputFormatters,
                onChanged: onChanged,
                cursorColor: Colors.black,
                onTap: onTap,
                readOnly: readOnly,
                controller: controller,
                keyboardType: keyboardType,
                style: TextStyle(
                  fontSize: fontSize ?? 18,
                  color: foregroundColor ?? Colors.black,
                ),
                decoration: InputDecoration(
                  errorText: errorText,
                  //  labelText: name,
                  fillColor: backgroundColor ?? AppColors.eyeBackground,
                  contentPadding: contentPadding ??
                      EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: (height ?? 50) / 2 - (fontSize ?? 18) / 2,),
                  suffixIcon: suffixIcon != null
                      ? Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: suffixIcon!,
                        )
                      : null,
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: height ?? 50,
                    maxWidth: 50,
                  ),
                  hintStyle: TextStyle(
                    fontSize: hintFontSize ?? 18,
                    color: hintForegroundColor ?? Colors.grey,
                    fontWeight: fw ?? FontWeight.normal,
                  ),
                  hintText: name,
                  border: InputBorder.none,
                ),
                validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
