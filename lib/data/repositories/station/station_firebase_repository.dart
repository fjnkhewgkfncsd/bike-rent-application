import 'package:bike_rental/data/dtos/station_dto.dart';
import 'package:bike_rental/data/repositories/station/station_repository.dart';
import 'package:bike_rental/domain/model/station/station.dart';
import 'package:firebase_database/firebase_database.dart';

class StationFirebaseRepository extends StationRepository {
  final FirebaseDatabase _firebaseDatabase;

  StationFirebaseRepository(FirebaseDatabase firebaseDatabase) : _firebaseDatabase = firebaseDatabase;

  @override
  Stream<List<Station>> watchStations() {
      final DatabaseReference stationsRef = _firebaseDatabase.ref('stations');
      return stationsRef.onValue.map((event) {
        final value = event.snapshot.value;

        if (value == null) {
          return [];
        }

        final Map<dynamic, dynamic> stationsData =
            Map<dynamic, dynamic>.from(value as Map);

        final List<Station> stations = stationsData.entries.map((entry) {
          final stationId = entry.key.toString();
          final stationInfo =
              Map<String, dynamic>.from(entry.value as Map);

          return StationDto.fromJson(stationId, stationInfo);
        }).toList();

        return stations;
      });
    }

    @override
    Future<void> updateStationAvailableBikeCount(String stationId, int newCount) async {
      try {
        final DatabaseReference stationRef = _firebaseDatabase.ref('stations/$stationId');
        await stationRef.update({'availableBike': newCount});
      } catch (e) {
        throw Exception('Failed to update available bike count: $e');
      }
    }

}