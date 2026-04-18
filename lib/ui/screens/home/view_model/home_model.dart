// ui/screens/home/view_model/home_model.dart
import 'dart:async';

import '../../../utils/async_value.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/station/station_repository.dart';
import '../../../../domain/model/station/station.dart';

class HomeViewModel extends ChangeNotifier {
  final StationRepository _stationRepository;

  AsyncValue<List<Station>> _state = AsyncValue.loading();

  StreamSubscription<List<Station>>? _subscription;

  HomeViewModel({required StationRepository stationRepository}) : _stationRepository = stationRepository;

  List<Station> get stations => _state.data ?? [];
  AsyncValue<List<Station>> get state => _state;
  void startWatchingStations() {
    if (_subscription != null) return;

    _state = AsyncValue.loading();
    notifyListeners();

    _subscription = _stationRepository.watchStations().listen(
      (stations) {
        _state = AsyncValue.success(stations);
        notifyListeners();
      },
      onError: (error) {
        _state = AsyncValue.error(error);
        notifyListeners();
      },
    );
  }

  void stopWatching() {
    _subscription?.cancel();
    _subscription = null;
  }

  @override
  void dispose() {
    stopWatching();
    super.dispose();
  }
}
