class User{
  final String id;
  final String email;
  final String username;
  final String passStatus;
  final String? passType;
  final DateTime? passExpiryDate;

  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.passStatus,
    this.passType,
    this.passExpiryDate,
  });

  User copyWith({
    String? email,
    String? username,
    String? passStatus,
    String? passType,
    DateTime? passExpiryDate,
  }) {
    return User(
      id: id,
      email: email ?? this.email,
      username: username ?? this.username,
      passStatus: passStatus ?? this.passStatus,
      passType: passType ?? this.passType,
      passExpiryDate: passExpiryDate ?? this.passExpiryDate,
    );
  }
}