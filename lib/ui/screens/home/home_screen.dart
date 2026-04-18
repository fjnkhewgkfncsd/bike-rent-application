// ui/screens/home/home_screen.dart
import 'package:bike_rental/ui/screens/passes/passes_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model/home_model.dart';
import '../home/widget/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (_) => PassesScreen()));
            },
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => HomeViewModel(stationRepository: context.read())..startWatchingStations(),
        child: HomeContent(),
      ),
    );
  }
}
