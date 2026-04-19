import 'package:bike_rental/ui/screens/passes/passes_screen.dart';
import 'package:bike_rental/ui/screens/station/view_model/station_view_model.dart';
import 'package:bike_rental/ui/widgets/generic_button.dart';
import 'package:bike_rental/ui/widgets/dialog.dart';
import 'package:bike_rental/ui/widgets/generic_tile.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';

class PaymentBottomSheet extends StatelessWidget {
    final String bikeName;
  final String slotId;
  final StationViewModel stationViewModel;
  final String stationId;

  const PaymentBottomSheet({
    super.key,
    required this.stationViewModel,
    required this.bikeName,
    required this.stationId,
    required this.slotId,
  });

  void onBooking(BuildContext context) async {
    final isSuccess = await stationViewModel.bookBike(
      stationId,
      slotId,
      bikeName,
      false,
    );

    if (!context.mounted) return;

    Navigator.pop(context); 

    if (!context.mounted) return;

    if (isSuccess) {
      showSuccessDialog(context);
    } else {
      showfailedDialog(context);
    }
  }

  void toPassScreen(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context,
    MaterialPageRoute(builder: (_) => PassesScreen())
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.backgroundModalSheet, 
      builder: (context) {
        return const SuccessDialog(message: "Your booking is confirmed!", buttonText: "Done");
      },
    );
  }

  void showfailedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.backgroundModalSheet, 
      builder: (context) {
        return const SuccessDialog(message: "Your booking has failed!", buttonText: "Try Again");
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppBorder.lg),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.bi),

          // drag handle
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.dragHandle,
              borderRadius: BorderRadius.circular(AppBorder.bi),
            ),
          ),

          const SizedBox(height: AppSpacing.bi),

          // title row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: AppFont.md,
                    fontWeight: AppFontWeight.medium,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(AppBorder.l),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.close, size: AppFont.xxl),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xs),

          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.divider,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l,vertical: AppSpacing.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenericListTile(
                  title: "No Pass Active", 
                  subtitle: "You dont have an active pass. Choose an option below.", 
                  leading: Icon(Icons.warning, color: AppColors.error), 
                  borderColor: AppColors.errorBorder, 
                  backgroundColor: AppColors.errorBackground
                ),
                SizedBox(height: AppSpacing.bi),
                Text('Options'),
                SizedBox(height: AppSpacing.bi),
                GenericListTile(
                  title: "Get a Pass", 
                  subtitle: "unlimited rides and best prices", 
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.extraLightBlue,
                      borderRadius: BorderRadius.circular(AppBorder.l),
                    ),
                    child: const Icon(Icons.credit_card, color: AppColors.background),
                  ), 
                  borderColor: AppColors.extraLightBlue, 
                  backgroundColor: AppColors.passBackground,
                  isTrailing: true,
                  onTap: () => toPassScreen(context),
                ),
                SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Container(color: AppColors.divider,
                        height: 1,
                        ),
                      ),
                    ),
                    SizedBox(width: AppSpacing.bi),
                    Text('Or'),
                    SizedBox(width: AppSpacing.bi),
                    Expanded(
                      child: SizedBox(
                        child: Container(color: AppColors.divider,
                        height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.sm),
                GenericButton(text: 'Buy Single Ride - 0.50',icon: Icons.airplane_ticket, onPressed: () => onBooking(context))
              ]
            ),
          ),
        ],
      ),
    );
  }
}

