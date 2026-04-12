import '../../domain/model/station/station_model.dart';


class StationDto {
  static const String nameKey = 'name';
  static const String availableKey = 'availableBikes';
  static const String totalSlotsKey = 'totalSlots';

  static Station fromJson(String id, Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[availableKey] is int);
    assert(json[totalSlotsKey] is int);

    return Station(
      id: id,
      name: json[nameKey],
      availableBikes: json[availableKey],
      totalSlots: json[totalSlotsKey]
    );
  }

  static Map<String, dynamic> toJson(Station station) {
    return {
      nameKey: station.name,
      availableKey : station.availableBikes,
      totalSlotsKey: station.totalSlots
    };
  }
}
