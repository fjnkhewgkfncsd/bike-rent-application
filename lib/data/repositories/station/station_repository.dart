import '../../../domain/model/station/station_model.dart';

abstract class StationRepository {
  Stream<List<Station>> watchStations();
}
