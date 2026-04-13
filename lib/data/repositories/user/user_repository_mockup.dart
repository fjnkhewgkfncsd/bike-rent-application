import '../../dtos/user_dto.dart';
import '../../repositories/user/user_repository.dart';
import '../../../domain/model/user/user.dart';
import '../../mockup_data.dart';

class UserRepositoryMockup extends UserRepository {
  @override
  Future<User> getUser(String userId) async {
    final user = users.entries.firstWhere((entry) => entry.key == userId);
    return UserDto.fromJson(user.key, user.value);
  }

  @override
  Future<void> updateUserPass({
    required String userId,
    required String passStatus,
    required String? passType,
    required DateTime? passExpiryDate,
  }) async {
    final user = users[userId] as Map<String, dynamic>;

    user['pass_status'] = passStatus;
    user['pass_type'] = passType;
    user['pass_expiry_date'] = passExpiryDate;
  }
}