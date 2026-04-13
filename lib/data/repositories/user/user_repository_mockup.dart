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
}
