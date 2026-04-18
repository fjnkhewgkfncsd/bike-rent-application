class User{
  final String id;
  final String email;
  final String username;
  final bool isPassActive;
  final String? passType;
  final DateTime? passExpiryDate;

  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.isPassActive,
    this.passType,
    this.passExpiryDate,
  });

  User copyWith({
    String? email,
    String? username,
    bool? isPassActive,
    String? passType,
    DateTime? passExpiryDate,
  }) {
    return User(
      id: id,
      email: email ?? this.email,
      username: username ?? this.username,
      isPassActive: isPassActive ?? this.isPassActive,
      passType: passType ?? this.passType,
      passExpiryDate: passExpiryDate ?? this.passExpiryDate,
    );
  }
}