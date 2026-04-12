import 'package:bike_rental/domain/model/user/user.dart';

abstract class UserRepository{
  Future<User> getUser(String userId);
} 