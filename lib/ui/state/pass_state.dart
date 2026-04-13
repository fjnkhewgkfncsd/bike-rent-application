import 'package:flutter/material.dart';
import '../../domain/model/pass/pass.dart';

class PassState extends ChangeNotifier {
  List<Pass> _passes = [];
  Pass? _selectedPass;

  List<Pass> get passes => _passes;
  Pass? get selectedPass => _selectedPass;

  void setPasses(List<Pass> passes) {
    _passes = passes;
    notifyListeners();
  }

  void selectPass(Pass pass) {
    _selectedPass = pass;
    notifyListeners();
  }

  void clearSelectedPass() {
    _selectedPass = null;
    notifyListeners();
  }
}