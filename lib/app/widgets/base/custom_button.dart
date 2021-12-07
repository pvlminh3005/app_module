import 'package:app_module/app/cores/value/app_color.dart';
import 'package:app_module/app/cores/value/font_size.dart';
import 'package:flutter/material.dart';

import '../custom_loading.dart';
import 'custom_text.dart';

class CustomBottomSizeStyle {
  static const WRAP_CONTENT = 0;
  static const MATCH_PARENT = 1;
}

class CustomButton extends StatefulWidget {
  final String title;
  final Color color, backgroundColor;
  final TextAlign textAlignment;
  final EdgeInsets margin;
  final double borderRadius;
  final double borderWidth;
  final double borderOpacity;
  final int sizeStyle;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final Future Function()? onTap;

  const CustomButton({
    this.title = 'Demo',
    this.backgroundColor = kPrimaryColor,
    this.color = Colors.white,
    this.textAlignment = TextAlign.center,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 5.0,
    this.borderWidth = 0,
    this.borderOpacity = 0.3,
    this.sizeStyle = CustomBottomSizeStyle.WRAP_CONTENT,
    this.fontWeight = FontWeight.w600,
    this.fontSize = FontSize.MEDIUM + 1,
    this.height = 55.0,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  void changeLoad() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.sizeStyle == CustomBottomSizeStyle.WRAP_CONTENT
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [_buildChild()],
          )
        : _buildChild();
  }

  Widget _buildChild() {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: Colors.black54.withOpacity(widget.borderOpacity),
            width: widget.borderWidth,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ), // Prevent ripple overflow
          child: Container(
            margin: widget.margin,
            height: widget.height,
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60),
              child: isLoading
                  ? CustomLoading()
                  : CustomText(
                      widget.title,
                      overflow: TextOverflow.visible,
                      color: widget.color,
                      fontSize: widget.fontSize,
                      fontWeight: widget.fontWeight,
                      align: widget.textAlignment,
                    ),
            ),
          ),
          onTap: widget.onTap == null
              ? null
              : () async {
                  changeLoad();
                  await widget.onTap!();
                  changeLoad();
                },
        ),
      ),
    );
  }
}
