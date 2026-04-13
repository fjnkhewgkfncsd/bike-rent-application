// ui/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import '../../state/station_state.dart';
import '../../../data/repositories/station/station_repository_mockup.dart';
import 'view_model/home_model.dart';
import '../home/widget/home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeModel? homeModel;

  @override
  void initState() {
    super.initState();

    // You can switch between mockup and Firebase here
    final stationState = StationState(
      repository: StationRepositoryMock(), // Use mockup for testing
      // repository: StationRepositoryFirebase(), // Use Firebase for production
    );

    homeModel = HomeModel(stationState: stationState);
    homeModel!.addListener(_onModelUpdated);
    homeModel!.startWatching();
  }

  @override
  void dispose() {
    homeModel?.removeListener(_onModelUpdated);
    homeModel?.dispose();
    super.dispose();
  }

  void _onModelUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Navigate to passes
            },
          ),
        ],
      ),
      body: HomeContent(homeModel: homeModel!),
    );
  }
}
