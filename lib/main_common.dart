// lib/main_common.dart
import 'package:bike_rental/ui/state/station_state.dart';
import 'package:bike_rental/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/screens/home/home_screen.dart';


class AppConfig {
  final String appTitle;
  final String flavor;

  const AppConfig({required this.appTitle, required this.flavor});
}

class MyApp extends StatelessWidget {
  final AppConfig config;

  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => StationState())],
      child: MaterialApp(
        title: config.appTitle,
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
