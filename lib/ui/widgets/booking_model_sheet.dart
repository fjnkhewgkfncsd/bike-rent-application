import 'package:bike_rental/ui/screens/station/view_model/station_view_model.dart';
import 'package:bike_rental/ui/widgets/generic_button.dart';
import 'package:bike_rental/ui/widgets/payment_modal_sheet.dart';
import 'package:bike_rental/ui/widgets/dialog.dart';
import 'package:flutter/material.dart';

class BookingBottomSheet extends StatelessWidget {
  final String bikeName;
  final String slotNumber;
  final StationViewModel stationViewModel;

  const BookingBottomSheet({
    super.key,
    required this.bikeName,
    required this.slotNumber,
    required this.stationViewModel,
  });

  void onBooking(BuildContext context) async {
    final navigator = Navigator.of(context);
    if (stationViewModel.isUserPassActive) {
      final isSuccess = await stationViewModel.bookBike(slotNumber,bikeName);
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
      showPaymentSheet(context, bikeName, slotNumber);
    }
  }

  void showPaymentSheet(BuildContext context, String bikeName, String slotNumber) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54, 
      isScrollControlled: true,
      builder: (context) {
        return PaymentBottomSheet(
          bikeName: bikeName,
          slotNumber: slotNumber,
          stationViewModel: stationViewModel,
        );
      },
    );

  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54, 
      builder: (context) {
        return const SuccessDialog(message: "Your booking is confirmed!", buttonText: "Done");
      },
    );
  }

  void showfailedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54, 
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
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          // drag handle
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 12),
          // title row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Confirm Booking',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.close, size: 22),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 26,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      bikeName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Do you want to book this bike?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 22),
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