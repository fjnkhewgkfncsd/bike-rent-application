import '../../domain/model/user/user.dart';

class UserDto{
  static const String idKey = 'id';
  static const String emailKey = 'email';
  static const String usernameKey = 'username';
  static const String passStatusKey = 'isPassActive';
  static const String passTypeKey = 'pass_type';
  static const String passExpiryDateKey = 'pass_expiry_date';

  static User fromJson(String id, Map<String, dynamic> json) {
    assert(json[emailKey] is String);
    assert(json[usernameKey] is String);
    assert(json[passStatusKey] is bool);
    assert(json[passTypeKey] == null || json[passTypeKey] is String);
    assert(json[passExpiryDateKey] == null || json[passExpiryDateKey] is String);

    return User(
      id: id,
      email: json[emailKey],
      username: json[usernameKey],
      isPassActive: json[passStatusKey],
      passType: json[passTypeKey],
      passExpiryDate: json[passExpiryDateKey] != null ? DateTime.parse(json[passExpiryDateKey]) : null
    );
  }
}