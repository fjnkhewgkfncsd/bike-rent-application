import 'package:bike_rental/ui/screens/station/view_model/station_view_model.dart';
import 'package:bike_rental/ui/theme/theme.dart';
import 'package:bike_rental/ui/widgets/generic_button.dart';
import 'package:bike_rental/ui/widgets/payment_modal_sheet.dart';
import 'package:bike_rental/ui/widgets/dialog.dart';
import 'package:flutter/material.dart';

class BookingBottomSheet extends StatelessWidget {
  final String stationId;
  final String bikeName;
  final String slotId;
  final StationViewModel stationViewModel;

  const BookingBottomSheet({
    super.key,
    required this.bikeName,
    required this.slotId,
    required this.stationId,
    required this.stationViewModel,
  });

  void onBooking(BuildContext context) async {
    final navigator = Navigator.of(context);
    if (stationViewModel.isUserPassActive) {
      final isSuccess = await stationViewModel.bookBike(stationId,slotId,bikeName, false);
      if(isSuccess) {
        navigator.pop();
        if(!navigator.mounted) return;
        showSuccessDialog(context);
      }else {
        if(!navigator.mounted) return;
        navigator.pop();
        showfailedDialog(context);  
      }
    }else{
      navigator.pop();
      if(!navigator.mounted) return;
      showPaymentSheet(context, bikeName, slotId);
    }
  }

  void showPaymentSheet(BuildContext context, String bikeName, String slotId) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.backgroundModalSheet, 
      isScrollControlled: true,
      builder: (context) {
        return PaymentBottomSheet(
          stationId: stationId,
          bikeName: bikeName,
          slotId: slotId,
          stationViewModel: stationViewModel,
        );
      },
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
                  'Confirm Booking',
                  style: TextStyle(
                    fontSize: AppFont.xMd,
                    fontWeight: AppFontWeight.medium,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.all(AppSpacing.xs),
                    child: Icon(Icons.close, size: AppFont.xxl),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.divider,
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.lg,
                ),
                decoration: BoxDecoration(
                  color: AppColors.insideMessageBackground,
                  borderRadius: BorderRadius.circular(AppBorder.md),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Bike - #$bikeName",
                      style: const TextStyle(
                        fontSize: AppFont.xMd,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const Text(
                      'Do you want to book this bike?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppFont.md,
                        color: AppColors.modalSheetMessage,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    GenericButton(text: "Booking",icon:Icons.airplane_ticket_outlined, onPressed: () => onBooking(context))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}