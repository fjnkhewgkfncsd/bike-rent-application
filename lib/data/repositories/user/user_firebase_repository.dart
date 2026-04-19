import 'package:bike_rental/data/dtos/user_dto.dart';
import 'package:bike_rental/data/repositories/user/user_repository.dart';
import 'package:bike_rental/domain/model/user/user.dart';
import 'package:firebase_database/firebase_database.dart';

class UserFirebaseRepository extends UserRepository{
  final FirebaseDatabase _database;

  UserFirebaseRepository(FirebaseDatabase database) : _database = database;

  @override
  Future<User> getUser(String userId) async {
    try{
      final snapshot = await _database.ref('users/$userId').get();
      if(!snapshot.exists) throw Exception('User not found');
      UserDto.fromJson(userId, Map<String, dynamic>.from(snapshot.value as Map));
      return UserDto.fromJson(userId, Map<String, dynamic>.from(snapshot.value as Map));
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  @override
  Future<void> updateUserPass({
    required String userId,
    required bool passStatus,
    required String? passType,
    required DateTime? passExpiryDate,
  }) async {
    try{
      final DatabaseReference userRef = _database.ref('users/$userId');
      await userRef.update({
        'isPassActive': passStatus,
        'pass_type': passType,
        'pass_expiry_date': passExpiryDate?.toIso8601String()
      });
    }catch(e){
      throw Exception('Failed to update user pass: $e');
    }
  }
}