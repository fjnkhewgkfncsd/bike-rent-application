import '../../domain/model/bike/bike_model.dart';

class BikeDto {
  static const String idKey = 'id';
  static const String numberKey = 'number';
  static const String slotKey = 'slot';
  static const String isAvailableKey = 'isAvailable';

  static Bike fromJson(Map<String, dynamic> json) {
    assert(json[idKey] is String);
    assert(json[numberKey] is String);
    assert(json[slotKey] is int);

    return Bike(
      id: json[idKey] as String,
      number: json[numberKey] as String,
      slot: json[slotKey] as int,
      isAvailable: json[isAvailableKey] as bool? ?? true,
    );
  }

  static Map<String, dynamic> toJson(Bike bike) {
    return {
      idKey: bike.id,
      numberKey: bike.number,
      slotKey: bike.slot,
      isAvailableKey: bike.isAvailable,
    };
  }

  static List<Bike> listFromJson(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> listToJson(List<Bike> bikes) {
    return bikes.map((bike) => toJson(bike)).toList();
  }
}
