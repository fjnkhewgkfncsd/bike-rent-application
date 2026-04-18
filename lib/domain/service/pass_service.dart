import '../../data/repositories/user/user_repository.dart';
import '../../domain/model/pass/pass.dart';

class PassService {
  final UserRepository userRepository;

  PassService({required this.userRepository});

  Future<void> subscribeToPass({
    required String userId,
    required Pass pass,
  }) async {
    final now = DateTime.now();

    DateTime expiryDate;

    switch (pass.passtype) {
      case 'day':
        expiryDate = now.add(const Duration(days: 1));
        break;
      case 'monthly':
        expiryDate = DateTime(now.year, now.month + 1, now.day, now.hour, now.minute);
        break;
      case 'annual':
        expiryDate = DateTime(now.year + 1, now.month, now.day, now.hour, now.minute);
        break;
      default:
        expiryDate = now;
    }

    await userRepository.updateUserPass(
      userId: userId,
      passStatus: 'active',
      passType: pass.passtype,
      passExpiryDate: expiryDate,
    );
  }
}