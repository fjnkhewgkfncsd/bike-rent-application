import 'package:bike_rental/ui/screens/passes/passes_screen.dart';
import 'package:bike_rental/ui/screens/station/view_model/station_view_model.dart';
import 'package:bike_rental/ui/widgets/generic_button.dart';
import 'package:bike_rental/ui/widgets/dialog.dart';
import 'package:bike_rental/ui/widgets/generic_tile.dart';
import 'package:flutter/material.dart';

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
    final navigator = Navigator.of(context);
    final isSuccess = await stationViewModel.bookBike(stationId, slotId, bikeName, false);
    if(isSuccess) {
      navigator.pop();
      if(!navigator.mounted) return;
      showSuccessDialog(context);
    }else {
      if(!navigator.mounted) return;
      navigator.pop();
      showfailedDialog(context);  
    }
  }

  void toPassScreen(BuildContext context) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => PassesScreen())
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
                  'Payment',
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

          const SizedBox(height: 4),

          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade300,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenericListTile(
                  title: "No Pass Active", 
                  subtitle: "You dont have an active pass. Choose an option below.", 
                  leading: Icon(Icons.warning, color: Colors.red), 
                  borderColor: const Color.fromARGB(255, 251, 61, 61), 
                  backgroundColor: const Color.fromARGB(255, 237, 159, 159)
                ),
                Divider(
                  height: 32,
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                Text('Options'),
                SizedBox(height:16),
                GenericListTile(
                  title: "Get a Pass", 
                  subtitle: "unlimited rides and best prices", 
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 61, 165, 251),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.credit_card, color: Colors.white),
                  ), 
                  borderColor: const Color.fromARGB(255, 61, 165, 251), 
                  backgroundColor: const Color.fromARGB(255, 127, 190, 241) ,
                  isTrailing: true,
                  onTap: () => toPassScreen(context),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Container(color: const Color.fromARGB(255, 177, 177, 177),
                        height: 1,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('Or'),
                    SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        child: Container(color: const Color.fromARGB(255, 177, 177, 177),
                        height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:8),
                GenericButton(text: 'Buy Single Ride - 0.50',icon: Icons.airplane_ticket, onPressed: () => onBooking(context))
              ]
            ),
          ),
        ],
      ),
    );
  }
}

