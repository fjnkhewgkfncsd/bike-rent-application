// ui/screens/home/view_model/home_model.dart
import 'package:flutter/material.dart';
import '../../../state/station_state.dart';
import '../../../../domain/model/station/station_model.dart';

class HomeModel extends ChangeNotifier {
  final StationState stationState;

  HomeModel({required this.stationState}) {
    stationState.addListener(_onStationStateChanged);
  }

  void _onStationStateChanged() {
    notifyListeners();
  }

  List<Station> get stations => stationState.stations;
  bool get isLoading => stationState.isLoading;
  String? get error => stationState.error;

  void startWatching() {
    stationState.startWatchingStations();
  }

  void onStationTap(String stationId) {
    // Navigate to station detail
    // You can access the full station data if needed
    final station = stations.firstWhere((s) => s.id == stationId);
    // Navigate with station data
  }

  @override
  void dispose() {
    stationState.removeListener(_onStationStateChanged);
    super.dispose();
  }
}
