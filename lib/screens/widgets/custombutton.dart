import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool filled;
  final IconData? icon;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? borderRadius;
  final Color? fillColor;    // for ElevatedButton background
  final Color? borderColor;  // for OutlinedButton border

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.filled = true,
    this.icon,
    this.width,
    this.height,
    this.textColor,
    this.borderRadius,
    this.fillColor,
    this.borderColor,   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.w600);

    // Determine text/icon color
    final Color foregroundColor = textColor ??
        (filled ? colors.onPrimary : colors.primary);

    final buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Icon(icon, size: 20, color: foregroundColor),
        if (icon != null) const SizedBox(width: 8),
        Text(label, style: textStyle.copyWith(color: foregroundColor)),
      ],
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
    );

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: filled
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: fillColor ?? colors.primary, // 🎯 dynamic fill color
                foregroundColor: foregroundColor,
                shape: shape,
                textStyle: textStyle,
              ),
              onPressed: onPressed,
              child: buttonChild,
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: foregroundColor,
                side: BorderSide(
                  color: borderColor ?? colors.primary, // 🎯 dynamic border color
                  width: 1.5,
                ),
                shape: shape,
                textStyle: textStyle,
              ),
              onPressed: onPressed,
              child: buttonChild,
            ),
    );
  }
}
