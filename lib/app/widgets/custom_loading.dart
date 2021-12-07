import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final Widget? child;
  final Color color;
  final double width;

  const CustomLoading({
    this.child = const SizedBox.shrink(),
    this.color = Colors.white,
    this.width = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        child!,
        CircularProgressIndicator(
          color: color,
          strokeWidth: width,
        ),
      ],
    );
  }
}
