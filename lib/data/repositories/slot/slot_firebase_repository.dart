import 'package:bike_rental/data/dtos/slot_dto.dart';
import 'package:bike_rental/data/repositories/slot/slot_repository.dart';
import 'package:bike_rental/domain/model/slot/slot.dart';
import 'package:firebase_database/firebase_database.dart';

class SlotFirebaseRepository extends SlotRepository {
  final FirebaseDatabase _database;

  SlotFirebaseRepository(FirebaseDatabase database) : _database = database;

  @override
  Stream<List<Slot>> watchAvailableSlots(String stationId) {
    final DatabaseReference slotsRef = _database.ref('stations/$stationId/slots');
    return slotsRef.onValue.map((event){
      final value = event.snapshot.value;

      if(value == null){
        return [];
      }

      final Map<dynamic, dynamic> slotsData =
        Map<dynamic, dynamic>.from(value as Map);

      final List<Slot> slots = slotsData.entries.map((entry) {
      final slotId = entry.key.toString();
      final slotInfo =
          Map<String, dynamic>.from(entry.value as Map);

      return SlotDto.fromJson(slotId, slotInfo);
    }).toList();
      slots.sort((a,b) => a.id.compareTo(b.id));
      return slots;
    }); 
  }

  @override
  Future<void> updateSlotStatus(String stationId, String slotId, String? bikeId, bool isOccupied) async {
    try{
      final DatabaseReference slotRef = _database.ref('stations/$stationId/slots/$slotId');
      if(isOccupied){
        await slotRef.update({
          'isOccupied': isOccupied,
          'bikeId': bikeId,
        });
      }else{
        await slotRef.update({
          'isOccupied': isOccupied,
          'bikeId': null,
        });
      }
    }catch(e){
      throw Exception('Failed to update slot status: $e');
    }
  }
}