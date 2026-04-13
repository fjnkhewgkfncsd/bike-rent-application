import '../../../domain/model/slot/slot.dart';

abstract class SlotRepository {
  Stream<List<Slot>> watchAvailableSlots();
}