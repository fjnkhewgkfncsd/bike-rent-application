import 'package:flutter/material.dart';
import 'package:bike_rental/data/repositories/user/user_repository.dart';
import 'package:bike_rental/domain/model/user/user.dart';

class MyPassViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  bool isLoading = true;
  String? error;
  User? user;

  MyPassViewModel({
    required this.userRepository,
  });

  Future<void> loadUser(String userId) async {
    try {
      isLoading = true;
      notifyListeners();

      user = await userRepository.getUser(userId);
      error = null;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  bool get hasActivePass => user?.passStatus == 'active';

  Future<void> cancelPass(String userId) async {
    await userRepository.updateUserPass(
      userId: userId,
      passStatus: 'inactive',
      passType: null,
      passExpiryDate: null,
    );

    await loadUser(userId);
  }
}