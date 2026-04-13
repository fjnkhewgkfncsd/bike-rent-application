// ui/screens/home/widgets/home_content.dart
import 'package:flutter/material.dart';
import '../view_model/home_model.dart';
import 'home_map_view.dart'; // Change this import
import '../../../theme/theme.dart';

class HomeContent extends StatelessWidget {
  final HomeModel homeModel;

  const HomeContent({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    if (homeModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (homeModel.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${homeModel.error}'),
            const SizedBox(height: AppSpacing.md),
            ElevatedButton(
              onPressed: () => homeModel.startWatching(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final stations = homeModel.stations;

    if (stations.isEmpty) {
      return const Center(child: Text('No stations available'));
    }

    // Use Map View instead of List View
    return HomeMapView(homeModel: homeModel);
  }
}
