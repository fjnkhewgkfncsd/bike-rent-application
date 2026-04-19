import 'package:flutter/material.dart';
import '../theme/theme.dart';

class GenericButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const GenericButton({super.key,required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () => onPressed(),
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lighblue,
          foregroundColor: AppColors.background,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorder.bi),
          ),
          textStyle: const TextStyle(
            fontSize: AppFont.md,
            fontWeight: AppFontWeight.medium,
          ),
        ),
      ),
    );
  }
}