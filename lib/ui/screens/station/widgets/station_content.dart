import 'package:bike_rental/ui/screens/station/widgets/slot_section.dart';
import 'package:bike_rental/ui/theme/theme.dart';
import '../view_model/station_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationContent extends StatelessWidget {
  const StationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final stationViewModel = context.watch<StationViewModel>();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md, 
            horizontal: AppSpacing.md, 
          ),
          decoration: BoxDecoration(
            color: AppColors.lighblue,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      stationViewModel.availableBikesNumber.toString(),
                      style: const TextStyle(
                        color: AppColors.background,
                        fontSize: AppFont.lg,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    const Text(
                      'Available Bikes',
                      style: TextStyle(color: AppColors.background, fontSize: AppFont.big,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 50,
                color: AppColors.background,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      stationViewModel.emptySlots.toString(),
                      style: const TextStyle(
                        color: AppColors.background,
                        fontSize: AppFont.lg,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    const Text(
                      'Empty Slots',
                      style: TextStyle(color: AppColors.background, fontSize: AppFont.big,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(child: const SlotSection()),
      ],
    );
  }
}
