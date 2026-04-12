class Station {
  final String id;
  final String name;
  final int availableBikes;
  final int totalSlots;

  const Station({required this.id, required this.name, required this.availableBikes, required this.totalSlots});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Station && other.id == id);

  @override
  int get hashCode => id.hashCode;

  Station copyWith({String? id, String ? name, int? availableBikes, int? totalSlots}) {
    return Station(
      id: id ?? this.id,
      name: name ?? this.name,
      availableBikes: availableBikes ?? this.availableBikes,
      totalSlots: totalSlots ?? this.totalSlots,
    );
  }
}
