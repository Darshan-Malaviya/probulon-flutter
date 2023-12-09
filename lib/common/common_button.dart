import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      this.height,
      this.width,
      this.child,
      this.onTap,
      this.decoratioin});

  final height;
  final width;
  final child;
  final onTap;
  final decoratioin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: decoratioin,
        child: child,
      ),
    );
  }
}
