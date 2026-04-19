import '../../../domain/model/slot/slot.dart';

abstract class SlotRepository {
  Stream<List<Slot>> watchAvailableSlots(String stationId);
  Future<void> updateSlotStatus(String stationId, String slotId, String? bikeId, bool isOccupied);
}