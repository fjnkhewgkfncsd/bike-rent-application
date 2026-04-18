// data/repositories/station/station_repository_mockup.dart
import 'dart:async';
import '../../dtos/station_dto.dart';
import '../../mockup_data.dart';
import '../../repositories/station/station_repository.dart';
import '../../../domain/model/station/station.dart';

class StationRepositoryMockup implements StationRepository {
  final StreamController<List<Station>> _controller =
      StreamController<List<Station>>.broadcast();

  List<Station> _stations = stations.entries
      .map((station) => StationDto.fromJson(station.key, station.value))
      .toList();

  @override
  Stream<List<Station>> watchStations() async* {
    yield List.unmodifiable(_stations);
    yield* _controller.stream;
  }
  @override
  Future<void> updateStationAvailableBikeCount(String stationId, int newCount) async {
    _stations = _stations.map((station) {
      if (station.id == stationId) {
        return station.copyWith(availableBikes: newCount);
      }
      return station;
    }).toList();

    _controller.add(List.unmodifiable(_stations));
  }

  Stream<Station> watchAStation(String stationId) async*{
    yield _stations.firstWhere((station) => station.id == stationId);
    yield* _controller.stream.map((stations) => stations.firstWhere((station) => station.id == stationId)); 
  }

  void updateStationLocation(
    String stationId,
    double latitude,
    double longitude,
  ) {
    _stations = _stations.map((station) {
      if (station.id == stationId) {
        return station.copyWith(latitude: latitude, longitude: longitude);
      }
      return station;
    }).toList();

    _controller.add(List.unmodifiable(_stations));
  }

  void dispose() {
    _controller.close();
  }
}
