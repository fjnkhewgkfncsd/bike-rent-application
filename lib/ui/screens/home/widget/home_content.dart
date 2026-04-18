// ui/screens/home/widgets/home_content.dart
import 'package:bike_rental/ui/utils/async_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_model.dart';
import 'home_map_view.dart'; // Change this import
import '../../../theme/theme.dart';

class HomeContent extends StatelessWidget {

  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeModel = context.watch<HomeViewModel>();

    switch(homeModel.state.state) {
      case AsyncValueState.loading:
        return const Center(child: CircularProgressIndicator());
      case AsyncValueState.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: ${homeModel.state.error}'),
              const SizedBox(height: AppSpacing.md),
              ElevatedButton(
                onPressed: () => homeModel.startWatchingStations(),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      case AsyncValueState.success:
        final stations = homeModel.stations;
        if (stations.isEmpty) {
          return const Center(child: Text('No stations available'));
        }
        return HomeMapView();
    }
  }
}
