import '../../../domain/model/station/station.dart';

abstract class StationRepository {
  Stream<List<Station>> watchStations();
  Future<void> updateStationAvailableBikeCount(String stationId, int newCount);
}
