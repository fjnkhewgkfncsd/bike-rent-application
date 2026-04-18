import 'dart:async';
import 'package:bike_rental/data/repositories/station/station_repository.dart';
import 'package:bike_rental/ui/state/user_state.dart';

import '../../../../domain/model/station/station.dart';
import '../../../../domain/model/slot/slot.dart';
import 'package:bike_rental/ui/utils/async_value.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/slot/slot_repository.dart';

class StationViewModel extends ChangeNotifier{
  final SlotRepository _slotRepository;
  final Station _station;
  final UserState _userState;
  final StationRepository _stationRepository;

  AsyncValue<List<Slot>> _state = AsyncValue.loading();

  StationViewModel({
    required SlotRepository slotRepository,
    required Station station,
    required UserState userState,
    required StationRepository stationRepository,
  }) : _slotRepository = slotRepository,
      _station = station,
      _userState = userState,
      _stationRepository = stationRepository{
        _userState.addListener(
          onUserStateChange
        );
      }

  void onUserStateChange() {
    notifyListeners();
  }

  List<Slot>? get availableBikes => _state.data?.where((slot) => slot.isOccupied).toList();
  AsyncValue<List<Slot>> get state => _state;
  int get availableBikesNumber => _state.data?.where((slot) => slot.isOccupied).length ?? _station.availableBikes;
  int get emptySlots => _station.totalSlots - availableBikesNumber;
  StreamSubscription<List<Slot>>? _subscription;
  bool get isUserPassActive => _userState.user?.isPassActive ?? false;
  String get stationId => _station.id;

  void startWatchingStationSlots() {
    if(_subscription != null) return;
    _state = AsyncValue.loading();
    notifyListeners();

    _subscription = _slotRepository.watchAvailableSlots(_station.id).listen(
      (slots) {
        _state = AsyncValue.success(slots);
        notifyListeners();
        // print('hi');
      },
      onError: (error) {
        _state = AsyncValue.error(error);
        notifyListeners();
      },
    );
  }

  Future<bool> bookBike(String stationId, String slotId,String bikeId, bool isOccupied) async {
    try{
      await _stationRepository.updateStationAvailableBikeCount(_station.id, availableBikesNumber - 1);
      await _slotRepository.updateSlotStatus(stationId, slotId, bikeId, isOccupied);
      return true;
    }catch(e){
      return false;
    }
  }

  void stopWatching() {
    _subscription?.cancel();
    _subscription = null;
  }

  @override
  void dispose() {
    stopWatching();
    _userState.removeListener(onUserStateChange);
    super.dispose();
  }
}