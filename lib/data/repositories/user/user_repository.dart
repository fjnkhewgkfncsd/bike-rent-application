import '../../../domain/model/user/user.dart';

abstract class UserRepository{
  Future<User> getUser(String userId);
} 