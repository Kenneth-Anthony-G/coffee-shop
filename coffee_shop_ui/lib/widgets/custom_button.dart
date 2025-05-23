import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Widget child;
  final Color color;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.child,
    required this.color,
    this.width = 40,
    this.height = 40,
    this.radius = 10,this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
