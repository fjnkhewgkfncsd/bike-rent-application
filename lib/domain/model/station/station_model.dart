import '../bike/bike_model.dart';

class Station {
  final String id;
  final String name;
  final List<Bike> bikes;

  const Station({required this.id, required this.name, required this.bikes});

  int get availableBikeCount => bikes.where((b) => b.isAvailable).length;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Station && other.id == id);

  @override
  int get hashCode => id.hashCode;

}
