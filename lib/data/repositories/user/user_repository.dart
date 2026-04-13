import '../../../domain/model/user/user.dart';

abstract class UserRepository {
  Future<User> getUser(String userId);

  Future<void> updateUserPass({
    required String userId,
    required String passStatus,
    required String? passType,
    required DateTime? passExpiryDate,
  });
}