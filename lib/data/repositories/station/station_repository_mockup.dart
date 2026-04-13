import 'dart:async';
import 'package:bike_rental/data/dtos/station_dto.dart';

import '../../mockup_data.dart';
import 'package:bike_rental/data/repositories/station/station_repository.dart';
import 'package:bike_rental/domain/model/station/station_model.dart';

class StationRepositoryMockup implements StationRepository {
  final StreamController<List<Station>> _controller =
      StreamController<List<Station>>.broadcast();

  List<Station> _stations = stations.entries.map((station) => StationDto.fromJson(station.key,station.value)).toList();

  @override
  Stream<List<Station>> watchStations() async* {
    yield List.unmodifiable(_stations);
    yield* _controller.stream;
  }

  void updateAvailableBikeCount(String stationId, int newCount) {
    _stations = _stations.map((station) {
      if (station.id == stationId) {
        return station.copyWith(availableBikes: newCount);
      }
      return station;
    }).toList();

    _controller.add(List.unmodifiable(_stations));
  }

  void dispose() {
    _controller.close();
  }
}
