class Station {
  final String id;
  final String name;
  final int availableBikes;
  final int totalSlots;
  final double? latitude;
  final double? longitude;

  const Station({
    required this.id,
    required this.name,
    required this.availableBikes,
    required this.totalSlots,
    this.latitude,
    this.longitude,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Station &&
          other.id == id &&
          other.name == name &&
          other.availableBikes == availableBikes &&
          other.totalSlots == totalSlots &&
          other.latitude == latitude &&
          other.longitude == longitude);

  @override
  int get hashCode =>
      Object.hash(id, name, availableBikes, totalSlots, latitude, longitude);

  Station copyWith({
    String? id,
    String? name,
    int? availableBikes,
    int? totalSlots,
    double? latitude,
    double? longitude,
  }) {
    return Station(
      id: id ?? this.id,
      name: name ?? this.name,
      availableBikes: availableBikes ?? this.availableBikes,
      totalSlots: totalSlots ?? this.totalSlots,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
  bool get hasValidCoordinates => latitude != null && longitude != null;
  int get availableSlots => totalSlots - availableBikes;
  double get occupancyPercentage => availableBikes / totalSlots;
}
