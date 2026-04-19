import 'package:bike_rental/ui/widgets/generic_button.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final String buttonText;
  const SuccessDialog({super.key, required this.message, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppBorder.l),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppFont.md,
                fontWeight: AppFontWeight.medium,
              ),
            ),
            const SizedBox(height: AppSpacing.l),
            GenericButton(text: buttonText, 
            icon: null, 
            onPressed: () {
              Navigator.pop(context);
            }
            )
          ],
        ),
      ),
    );
  }
}