import 'package:bike_rental/data/repositories/station/station_repository.dart';
import 'package:bike_rental/ui/state/user_state.dart';
import 'package:bike_rental/ui/theme/theme.dart';
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
          color: AppColors.background,
          onPressed: () => Navigator.of(context).pop(),
          
        ),
        backgroundColor: AppColors.topnaviblue,
        title: Text(station.name,   style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body:  ChangeNotifierProvider(
        create: (_) => StationViewModel(slotRepository: context.read(), station: station, userState: context.read<UserState>(), stationRepository: context.read<StationRepository>())..startWatchingStationSlots(),
        child: StationContent(),
      )
    );
  }
}