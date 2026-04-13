import '../../domain/model/station/station_model.dart';

class StationDto {
  static const String nameKey = 'name';
  static const String availableKey = 'availableBike';
  static const String totalSlotsKey = 'totalSlots';
  static const String latitudeKey = 'latitude';
  static const String longitudeKey = 'longitude';

  static Station fromJson(String id, Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[availableKey] is int);
    assert(json[totalSlotsKey] is int);

    return Station(
      id: id,
      name: json[nameKey],
      availableBikes: json[availableKey],
      totalSlots: json[totalSlotsKey],
      latitude: json[latitudeKey] as double?,
      longitude: json[longitudeKey] as double?,
    );
  }

  static Map<String, dynamic> toJson(Station station) {
    return {
      nameKey: station.name,
      availableKey: station.availableBikes,
      totalSlotsKey: station.totalSlots,
      if (station.latitude != null) latitudeKey: station.latitude,
      if (station.longitude != null) longitudeKey: station.longitude,
    };
  }
}
