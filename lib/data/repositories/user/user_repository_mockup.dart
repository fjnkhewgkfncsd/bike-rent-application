import 'package:bike_rental/data/dtos/user_dto.dart';
import 'package:bike_rental/data/repositories/user/user_repository.dart';
import 'package:bike_rental/domain/model/user/user.dart';
import '../../mockup_data.dart';

class UserRepositoryMockup extends UserRepository {
  @override
  Future<User> getUser(String userId) async {
    final user = users.entries.firstWhere((entry) => entry.key == userId);
    return UserDto.fromJson(user.key, user.value);
  }
}
