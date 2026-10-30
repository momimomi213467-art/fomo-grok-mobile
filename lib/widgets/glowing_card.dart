import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GlowingCard extends StatelessWidget {
  final Widget child;
  final Color glowColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double? width;
  final double? height;

  const GlowingCard({
    super.key,
    required this.child,
    this.glowColor = AppTheme.neonCyan,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.all(12),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: glowColor.withOpacity(0.35), width: 1),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
