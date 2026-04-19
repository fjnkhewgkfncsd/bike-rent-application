import 'package:bike_rental/data/repositories/pass/pass_repository.dart';
import 'package:bike_rental/ui/screens/passes/view_model/passes_view_model.dart';
import 'package:bike_rental/ui/screens/passes/widgets/passes_content.dart';
import 'package:bike_rental/ui/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme.dart';

class PassesScreen extends StatelessWidget {
  const PassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PassesViewModel(
        userState: context.read<UserState>(),
        passRepository: context.read<PassRepository>(),
      ),
      child: Builder(
        builder: (context) {
          final userState = context.watch<UserState>();
          final user = userState.user;
          final vm = context.watch<PassesViewModel>();

          return Scaffold(
            appBar: AppBar(
              title: Text(
                user == null
                    ? 'Loading...'
                    : user.isPassActive
                        ? 'Manage Your Pass'
                        : 'Choose a Pass',
              ),
            ),
            body: PassesContent(passesVM: vm, ),
            bottomNavigationBar: (user == null || !user.isPassActive)
                ? const SizedBox()
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            vm.cancelSubscription();
                          },
                          icon: const Icon(Icons.close),
                          label: const Text('Cancel Plan'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lighblue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppBorder.bi),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}