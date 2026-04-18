// ui/screens/station_detail/station_detail_screen.dart
import 'package:flutter/material.dart';
import '../../../domain/model/station/station.dart';
import '../../theme/theme.dart';

class StationDetailScreen extends StatelessWidget {
  final Station station;

  const StationDetailScreen({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    final availableSlots = station.totalSlots - station.availableBikes;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Station Detail'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Station Name
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text(
              station.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Stats Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              children: [
                // Available Bikes
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${station.availableBikes}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.success,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const Text(
                          'Available Bikes',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                // Empty Slots
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.error.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$availableSlots',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.error,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const Text(
                          'Empty Slots',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Available Bikes Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Available Bikes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          // Bikes List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: station.availableBikes,
              itemBuilder: (context, index) {
                final bikeNumber = index + 1;
                final isLastDock =
                    bikeNumber == 6; // For "Standard · Dock 6" example

                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.pedal_bike,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        'Bike #${bikeNumber.toString().padLeft(3, '0')}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: isLastDock
                          ? const Text('Standard · Dock 6')
                          : null,
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Handle rent bike action
                          _showRentDialog(context, bikeNumber);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(80, 35),
                        ),
                        child: const Text('Rent'),
                      ),
                    ),
                    if (index < station.availableBikes - 1)
                      const Divider(height: 1),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showRentDialog(BuildContext context, int bikeNumber) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rent Bike'),
        content: Text(
          'Do you want to rent Bike #${bikeNumber.toString().padLeft(3, '0')}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Bike #${bikeNumber.toString().padLeft(3, '0')} rented successfully!',
                  ),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
