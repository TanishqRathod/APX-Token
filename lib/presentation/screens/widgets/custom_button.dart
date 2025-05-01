import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor = const Color(0xff2A983D),
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = icon != null
        ? ElevatedButton.icon(
      onPressed: onPressed,
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
      label: Text(
        label,
        style: textStyle ??
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    )
        : ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle ??
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return child;
  }
}
