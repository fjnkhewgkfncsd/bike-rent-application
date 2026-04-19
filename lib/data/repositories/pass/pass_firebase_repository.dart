import 'package:bike_rental/data/dtos/pass_dto.dart';
import 'package:bike_rental/domain/model/pass/pass.dart';
import 'package:firebase_database/firebase_database.dart';
import './pass_repository.dart';

class PassFirebaseRepository extends PassRepository{
    final FirebaseDatabase _database;
    PassFirebaseRepository(FirebaseDatabase database) : _database = database;

    List<Pass> _cachedPasses = [];
    @override
    Future<List<Pass>> getAllPasses() async {
        if(_cachedPasses.isNotEmpty){
            return _cachedPasses;
        }
        final passSnapshot = await _database.ref('passes').get();
        if(!passSnapshot.exists) return [];
        final data = Map<dynamic, dynamic>.from(passSnapshot.value as Map);
        final List<Pass> passes = data.entries.map((entry){
            return PassDto.fromJson(entry.key.toString(), Map<String, dynamic>.from(entry.value as Map));
        }).toList();
        _cachedPasses = passes;
        return passes;
    }
}