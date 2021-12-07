import 'package:app_module/app/cores/theme/font_family.dart';
import 'package:app_module/app/cores/value/app_color.dart';
import 'package:app_module/app/cores/value/dimen.dart';
import 'package:app_module/app/cores/value/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText, labelText;
  final Color backgroundColor, textColor, hintTextColor, labelTextColor;
  final FontWeight fontWeight;
  final EdgeInsets margin;
  final double borderRadius;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool showSuffix;
  final bool isPassword;

  final BorderSide? borderSide;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final TextCapitalization capitalization;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomInput({
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.backgroundColor = kPrimaryColor,
    this.textColor = Colors.black,
    this.hintTextColor = kTextColorLight,
    this.labelTextColor = kTextColorLight,
    this.fontWeight = FontWeight.w500,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 8.0,
    this.enabled = true,
    this.maxLength,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.showSuffix = false,
    this.isPassword = false,
    this.borderSide,
    this.keyboardType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.capitalization = TextCapitalization.none,
    this.validator,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusSmall),
      borderSide: widget.borderSide ?? BorderSide(color: kColorGreyLight),
    );
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusSmall),
      borderSide: BorderSide(color: kColorGrey),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimen.radiusSmall),
      borderSide: BorderSide(color: kPrimaryColor),
    );

    return Padding(
      padding: widget.margin,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        textInputAction: widget.inputAction,
        textCapitalization: widget.capitalization,
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        obscureText: widget.isPassword ? _obscureText : false,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        style: TextStyle(
          fontSize: FontSize.MEDIUM,
          color: widget.textColor,
          fontWeight: widget.fontWeight,
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          hintStyle: TextStyle(
            fontFamily: FontFamily.nunitoSans,
            fontWeight: FontWeight.w400,
            color: widget.hintTextColor,
          ),
          labelStyle: TextStyle(
            fontFamily: FontFamily.nunitoSans,
            fontWeight: FontWeight.w400,
            color: widget.labelTextColor,
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.showSuffix
              ? widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye_fill,
                        color: kColorGrey,
                      ),
                    )
                  : widget.suffixIcon
              : null,
          enabled: widget.enabled,
          counterText: '',
          border: border,
          enabledBorder: border,
          focusedBorder: focusBorder,
          errorBorder: errorBorder,
        ),
      ),
    );
  }
}
