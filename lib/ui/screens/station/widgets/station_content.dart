import 'package:bike_rental/ui/screens/station/widgets/slot_section.dart';
import '../view_model/station_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationContent extends StatelessWidget{
  const StationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final stationViewModel = context.watch<StationViewModel>();
    return Column(
      children : [
        Container(
          color: Colors.blue,
          child: Row(
            children : [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(stationViewModel.availableBikesNumber.toString()),
                    const Text('Available Bikes'),
                  ],
                ),
              ),
              SizedBox(width:1,height: 20,child:Container(color: Colors.grey,)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(stationViewModel.emptySlots.toString()),
                    const Text('Empty Slots'),
                  ],
                ),
              ),
            ]
          ),
        ),
        Expanded(child: SlotSection())
      ]
    );
  }
}