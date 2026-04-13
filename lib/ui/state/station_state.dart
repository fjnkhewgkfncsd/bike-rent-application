import 'dart:async';
import 'package:flutter/material.dart';
import '../../data/repositories/station/station_repository.dart';
import '../../domain/model/station/station_model.dart';
import '../../data/repositories/station/station_repository_mockup.dart';

class StationState extends ChangeNotifier {
  final StationRepository _repository;

  List<Station> _stations = [];
  bool _isLoading = false;
  String? _error;
  StreamSubscription<List<Station>>? _subscription;

  StationState({StationRepository? repository})
    : _repository = repository ?? StationRepositoryMock(); 

  List<Station> get stations => _stations;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void startWatchingStations() {
    if (_subscription != null) return;

    _isLoading = true;
    notifyListeners();

    _subscription = _repository.watchStations().listen(
      (stations) {
        _stations = stations;
        _isLoading = false;
        _error = null;
        notifyListeners();
      },
      onError: (error) {
        _error = error.toString();
        _isLoading = false;
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
