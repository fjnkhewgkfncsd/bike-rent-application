import 'package:bike_rental/data/repositories/station/station_repository.dart';
import 'package:bike_rental/ui/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './view_model/station_view_model.dart';
import '../../../domain/model/station/station.dart';
import './widgets/station_content.dart';

class StationScreen extends StatelessWidget{
  final Station station;
  const StationScreen({super.key,required this.station});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
        title: Text(station.name),
      ),
      body:  ChangeNotifierProvider(
        create: (_) => StationViewModel(slotRepository: context.read(), station: station, userState: context.read<UserState>(), stationRepository: context.read<StationRepository>())..startWatchingStationSlots(),
        child: StationContent(),
      )
    );
  }
}