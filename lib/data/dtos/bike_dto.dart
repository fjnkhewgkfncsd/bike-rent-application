import '../../domain/model/bike/bike_model.dart';

class BikeDto {
  static const String idKey = 'id';
  static const String isAvailableKey = 'isAvailable';

  static Bike fromJson(String id, Map<String, dynamic> json) {
    assert(json[isAvailableKey] is bool);

    return Bike(
      id: id,
      isAvailable: json[isAvailableKey],
    );
  }

  static Map<String, dynamic> toJson(Bike bike) {
    return {
      idKey: bike.id,
      isAvailableKey: bike.isAvailable,
    };
  }
}
