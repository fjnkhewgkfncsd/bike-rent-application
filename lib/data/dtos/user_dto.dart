import '../../domain/model/user/user.dart';

class UserDto{
  static const String idKey = 'id';
  static const String emailKey = 'email';
  static const String usernameKey = 'username';
  static const String passStatusKey = 'pass_status';
  static const String passTypeKey = 'pass_type';
  static const String passExpiryDateKey = 'pass_expiry_date';

  static User fromJson(String id, Map<String, dynamic> json) {
    assert(json[emailKey] is String);
    assert(json[usernameKey] is String);
    assert(json[passStatusKey] is String);
    assert(json[passTypeKey] == null || json[passTypeKey] is String);
    assert(json[passExpiryDateKey] == null || json[passExpiryDateKey] is DateTime);

    return User(
      id: id,
      email: json[emailKey],
      username: json[usernameKey],
      passStatus: json[passStatusKey],
      passType: json[passTypeKey],
      passExpiryDate: json[passExpiryDateKey] 
    );
  }
}