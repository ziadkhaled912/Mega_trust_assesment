import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final TextInputAction? textInputAction;
  final String? hint;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final String? Function(String?) validation;
  final String? labelText;
  final Widget? prefix;
  final Function()? onTap;
  final Widget? suffix;
  final bool isSecure;
  final bool enabled;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final bool hasBorder;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final bool isOptional;
  final bool isRequired;
  final int? minLines;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.type,
    this.textInputAction,
    this.hint,
    this.onSubmit,
    this.onChange,
    required this.validation,
    this.labelText,
    this.prefix,
    this.onTap,
    this.suffix,
    this.isSecure = false,
    this.enabled = true,
    this.onSaved,
    this.focusNode,
    this.hasBorder = true,
    this.backgroundColor,
    this.borderRadius = 10,
    this.contentPadding,
    this.inputFormatters,
    this.isOptional = false,
    this.isRequired = false,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: textInputAction == TextInputAction.next ? (value) {
        FocusScope.of(context).nextFocus();
      } : onSubmit,
      onChanged: onChange,
      onTap: onTap,
      onSaved: onSaved,
      validator: validation,
      obscureText: isSecure,
      style: AppTextStyles.thirdTextStyle(),
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: minLines,
      maxLines: isSecure ? 1 : maxLines,
      decoration: InputDecoration(
        filled: backgroundColor != null ? true : false,
        fillColor: backgroundColor,
        labelText: labelText,
        hintText: hint,
        contentPadding: contentPadding,
        hintStyle: AppTextStyles.subTextStyle().copyWith(color: Colors.black54),
        suffixIcon: suffix,
        prefixIcon: prefix,
        border: hasBorder ? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(borderRadius),
        ) : InputBorder.none,
      ),
    );
  }
}
