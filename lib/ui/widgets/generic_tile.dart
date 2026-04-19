import '../theme/theme.dart';
import 'package:flutter/material.dart';

class GenericListTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final String? subtitle;
  final bool? isTrailing;
  final Widget? trailing;
  final Color? borderColor;
  final Color backgroundColor; 
  final Color? titleColor;
  final VoidCallback? onTap;
  final bool? addPadding;

  const GenericListTile({
    this.addPadding,
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.borderColor,
    this.titleColor = AppColors.textPrimary,
    required this.backgroundColor,
    this.isTrailing = false,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,  
        border: borderColor != null ? Border.all(
          color: borderColor!,
          width: 2,
        ) : null,
        borderRadius: BorderRadius.circular(AppSpacing.bi), 
      ),
      child: ListTile(
        contentPadding: addPadding == true ? const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md) : null,
        leading : leading,
        title: Text(title, style: TextStyle(color: titleColor)),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: trailing ?? (isTrailing == true ? Icon(Icons.arrow_forward_ios, size: AppFont.md) : null),
        onTap: onTap,
      )
    );
  }
}