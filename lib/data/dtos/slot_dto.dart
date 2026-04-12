import 'package:bike_rental/domain/model/slot/slot.dart';

class SlotDto {
  static const String idKey = 'id';
  static const String isOccupiedKey = 'isOccupied';
  static const String bikeIdKey = 'bikeId';

  static Slot fromJson(String id, Map<String, dynamic> json) {
    assert(json[isOccupiedKey] is bool);
    assert(json[bikeIdKey] == null || json[bikeIdKey] is String);

    return Slot(
      id: id,
      isOccupied: json[isOccupiedKey],
      bikeId: json[bikeIdKey],
    );
  }
}