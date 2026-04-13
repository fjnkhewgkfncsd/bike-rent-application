import 'dart:async';
import '../../dtos/slot_dto.dart';
import '../../mockup_data.dart';
import '../../../domain/model/slot/slot.dart';
import './slot_repository.dart';

class SlotRepositoryMockup extends SlotRepository {
  final StreamController<List<Slot>> _controller = StreamController<List<Slot>>.broadcast();

  final List<Slot> _slots = slots.entries.map((entry) => SlotDto.fromJson(entry.key, entry.value)).toList();

  @override
  Stream<List<Slot>> watchAvailableSlots() async*{
    yield List.unmodifiable(_slots);
    yield* _controller.stream;
  }

    void updateSlotStatus(String slotId,String? bikeId, bool isOccupied) {
    for (var slot in _slots) {
      if (slot.id == slotId) {
        final updatedSlot = slot.copyWith(isOccupied: isOccupied, bikeId: bikeId);
        _slots[_slots.indexOf(slot)] = updatedSlot;
        break;
      }
    }
    _controller.add(List.unmodifiable(_slots));
  }

  void dispose() {
    _controller.close();
  }
}
