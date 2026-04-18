import 'package:flutter/material.dart';
import 'package:bike_rental/domain/model/slot/slot.dart';

class SlotListTile extends StatelessWidget {
  const SlotListTile({
    super.key,
    required this.slot,
    required this.onTap,
  });

  final Slot? slot;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap : (){
        onTap();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(slot?.id ??''),
      ),
      title: Text('Bike ${slot?.bikeId ?? ''}'),
      trailing: Container(
        alignment: Alignment.center, 
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.directions_bike),
      ),
    );
  }
}