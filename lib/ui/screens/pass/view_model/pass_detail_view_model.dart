import 'package:flutter/material.dart';
import 'package:bike_rental/domain/model/pass/pass.dart';
import 'package:bike_rental/domain/service/pass_service.dart';
import 'package:bike_rental/ui/state/pass_state.dart';

class PassDetailViewModel extends ChangeNotifier {
  final PassState passState;
  final PassService passService;

  bool isSubmitting = false;
  String? error;
  bool isSuccess = false;

  PassDetailViewModel({
    required this.passState,
    required this.passService,
  });

  Pass? get selectedPass => passState.selectedPass;

  Future<void> subscribe(String userId) async {
    final pass = selectedPass;
    if (pass == null) {
      error = 'No pass selected';
      notifyListeners();
      return;
    }

    try {
      isSubmitting = true;
      error = null;
      isSuccess = false;
      notifyListeners();

      await passService.subscribeToPass(userId: userId, pass: pass);

      isSuccess = true;
    } catch (e) {
      error = e.toString();
    }

    isSubmitting = false;
    notifyListeners();
  }
}