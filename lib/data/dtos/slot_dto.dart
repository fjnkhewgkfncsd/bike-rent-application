import '../../domain/model/slot/slot.dart';

class SlotDto {
  static const String idKey = 'id';
  static const String isOccupiedKey = 'isOccupied';
  static const String bikeIdKey = 'bikeId';
  static const String slotNumberKey = 'slotNumber';

  static Slot fromJson(String id, Map<String, dynamic> json) {
    assert(json[isOccupiedKey] is bool);
    assert(json[bikeIdKey] == null || json[bikeIdKey] is String);
    assert(json[slotNumberKey] is int);

    return Slot(
      id: id,
      slotNumber: json[slotNumberKey],
      isOccupied: json[isOccupiedKey],
      bikeId: json[bikeIdKey],
    );
  }
}