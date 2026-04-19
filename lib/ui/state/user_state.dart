import 'package:bike_rental/data/repositories/user/user_repository.dart';
import 'package:bike_rental/domain/model/user/user.dart';
import 'package:bike_rental/ui/utils/async_value.dart';
import 'package:flutter/material.dart';

class UserState extends ChangeNotifier{
  final UserRepository userRepository;
  UserState({required this.userRepository});

  AsyncValue<User> _state = AsyncValue.loading();
  User? get user => _state.data;

  Future<void> loadUser(String userId) async {
    try{
      _state = AsyncValue.loading();
      notifyListeners();
      final user = await userRepository.getUser(userId);
      _state = AsyncValue.success(user);
      notifyListeners();
    }catch(e){
      _state = AsyncValue.error('Failed to load user');
      notifyListeners();
    }
  }

  void updateUser(String passType, DateTime? expiryDate, bool isActive) {
  final currentUser = _state.data;
  if (currentUser == null) return;

  _state = AsyncValue.success(
    currentUser.copyWith(
      passExpiryDate: expiryDate,
      passType: passType,
      isPassActive: isActive,
    ),
  );
  notifyListeners();
}

  void updateUserPassInFirebase({
    required bool passStatus,
    required String passType,
    required DateTime? passExpiryDate
  }) async {
    await userRepository.updateUserPass(
      userId: _state.data!.id,
      passStatus: passStatus,
      passType: passType,
      passExpiryDate: passExpiryDate
    );
    updateUser(passType, passExpiryDate, passStatus);
  }
}