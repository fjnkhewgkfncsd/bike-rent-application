import 'package:bike_rental/data/repositories/pass/pass_repository.dart';
import 'package:bike_rental/domain/model/pass/pass.dart';
import 'package:bike_rental/ui/state/user_state.dart';
import 'package:bike_rental/ui/utils/async_value.dart';
import 'package:flutter/material.dart';

class PassesViewModel extends ChangeNotifier {
  final UserState userState;
  final PassRepository passRepository;

  AsyncValue<List<Pass>> state = AsyncValue.loading();
  bool get isUserPassActive => userState.user!.isPassActive;
  List<Pass> get passes => state.data ?? [];
  
  PassesViewModel({
    required this.userState,
    required this.passRepository,
  }){
    loadPasses();
    userState.addListener(onUserStateChange);
  }

  void onUserStateChange() {
    notifyListeners();
  }

  void loadPasses() async {
    try {
      state = AsyncValue.loading();
      notifyListeners();
      final passes = await passRepository.getAllPasses();
      state = AsyncValue.success(passes);
      notifyListeners();
    } catch (e) {
      state = AsyncValue.error('Failed to load passes');
      notifyListeners();
    }
  }

  void userSubscriptPass(String passType,DateTime passExpiryDate){
    try{
      userState.updateUserPassInFirebase(passStatus: true, passType: passType, passExpiryDate: passExpiryDate);
    }catch(e){
      state = AsyncValue.error('Failed to subscribe to pass');
      notifyListeners();
    }
  }

  void cancelSubscription(){
    try{
    userState.updateUserPassInFirebase(passStatus: false, passType: '', passExpiryDate: DateTime.now());
    }catch(e){
      state = AsyncValue.error('Failed to cancel subscription');
      notifyListeners();
    }
  }

  @override
  void dispose() {
    userState.removeListener(onUserStateChange);
    super.dispose();
  }
}