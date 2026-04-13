import 'package:flutter/material.dart';
import 'package:bike_rental/data/repositories/pass/pass_repository.dart';
import 'package:bike_rental/domain/model/pass/pass.dart';
import 'package:bike_rental/ui/state/pass_state.dart';

class PassSelectionViewModel extends ChangeNotifier {
  final PassRepository passRepository;
  final PassState passState;

  bool isLoading = true;
  String? error;

  PassSelectionViewModel({
    required this.passRepository,
    required this.passState,
  }) {
    loadPasses();
  }

  List<Pass> get passes => passState.passes;

  Future<void> loadPasses() async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await passRepository.getAllPasses();
      passState.setPasses(result);

      error = null;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  void selectPass(Pass pass) {
    passState.selectPass(pass);
  }
}