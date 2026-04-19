import 'package:flutter/material.dart';
import 'package:bike_rental/domain/model/slot/slot.dart';
import 'package:bike_rental/ui/theme/theme.dart';

class SlotListTile extends StatelessWidget {
  const SlotListTile({super.key, required this.slot, required this.onTap});

  final Slot slot;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppBorder.bi),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.08), 
            blurRadius: AppBorder.sm,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppBorder.bi),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.info.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppBorder.bi),
                  ),
                  child: Text(
                    slot.slotNumber.toString(),
                    style: TextStyle(
                      color: AppColors.info,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bike #${slot.bikeId}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppFont.md,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.info,
                    borderRadius: BorderRadius.circular(AppBorder.l),
                  ),
                  child: const Icon(
                    Icons.directions_bike,
                    color: AppColors.background,
                    size: AppFont.l,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
