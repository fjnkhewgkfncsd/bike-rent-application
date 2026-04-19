import 'package:bike_rental/domain/model/slot/slot.dart';
import 'package:bike_rental/ui/screens/station/view_model/station_view_model.dart';
import 'package:bike_rental/ui/screens/station/widgets/slot_tile.dart';
import 'package:bike_rental/ui/utils/async_value.dart';
import 'package:bike_rental/ui/widgets/booking_model_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlotSection extends StatelessWidget {
  const SlotSection({super.key});

  @override
  Widget build(BuildContext context) {

    final stationViewModel = context.watch<StationViewModel>();
    final AsyncValue<List<Slot>> state = stationViewModel.state;

    Widget content ;

    void showBookingSheet(BuildContext context,String bikeId,String slotId,String stationId) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black54, 
        isScrollControlled: true,
        builder: (context) {
          return BookingBottomSheet(
            bikeName: bikeId,
            slotId: slotId,
            stationViewModel: stationViewModel,
            stationId: stationId,
          );
        },
      );
    }
    switch(state.state) {
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: ${state.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => stationViewModel.startWatchingStationSlots(),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
        break;
      case AsyncValueState.success:
        if(stationViewModel.availableBikesNumber == 0){
          content = const Center(child: Text('No available bikes'));
        } else {
          content = Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Bikes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: stationViewModel.availableBikesNumber,
                    itemBuilder: (context, index) {
                      return SlotListTile(
                        slot: stationViewModel.availableBikes![index],
                        onTap: () => showBookingSheet(context, stationViewModel.availableBikes![index].bikeId ?? '', stationViewModel.availableBikes![index].id, stationViewModel.stationId),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        break;
    }
    return content;
  }
}