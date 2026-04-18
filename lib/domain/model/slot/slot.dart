class Slot {
  final String id;
  final int slotNumber;
  final bool isOccupied;
  final String? bikeId;

  const Slot({
    required this.id,
    required this.slotNumber,
    required this.isOccupied,
    this.bikeId,
  });

  Slot copyWith({required bool isOccupied, String? bikeId}) {
    return Slot(
      id: id,
      slotNumber: slotNumber,
      isOccupied: isOccupied,
      bikeId: isOccupied ? bikeId : null,
    );
  }
}