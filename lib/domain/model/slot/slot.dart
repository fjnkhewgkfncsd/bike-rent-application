class Slot {
  final String id;
  final bool isOccupied;
  final String? bikeId;

  const Slot({
    required this.id,
    required this.isOccupied,
    this.bikeId,
  });

  Slot copyWith({required bool isOccupied, String? bikeId}) {
    return Slot(
      id: id,
      isOccupied: isOccupied,
      bikeId: isOccupied ? bikeId : null,
    );
  }
}