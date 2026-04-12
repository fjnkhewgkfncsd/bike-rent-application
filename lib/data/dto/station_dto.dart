import '../../domain/model/station/station_model.dart';
import 'bike_dto.dart';

class StationDto {
  const StationDto._();

  static const String idKey = 'id';
  static const String nameKey = 'name';
  static const String bikesKey = 'bikes';

  static Station fromJson(Map<String, dynamic> json) {
    assert(json[idKey] is String);
    assert(json[nameKey] is String);
    assert(json[bikesKey] is List);

    final bikesJson = json[bikesKey] as List<Map<String, dynamic>>;
    final bikes = bikesJson
        .map((bikeJson) => BikeDto.fromJson(bikeJson))
        .toList();

    return Station(
      id: json[idKey] as String,
      name: json[nameKey] as String,
      bikes: bikes,
    );
  }

  static Map<String, dynamic> toJson(Station station) {
    return {
      idKey: station.id,
      nameKey: station.name,
      bikesKey: station.bikes.map((bike) => BikeDto.toJson(bike)).toList(),
    };
  }

  static List<Station> listFromJson(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> listToJson(List<Station> stations) {
    return stations.map((station) => toJson(station)).toList();
  }
}
