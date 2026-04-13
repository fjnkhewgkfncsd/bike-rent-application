// lib/main_dev.dart
import 'package:flutter/material.dart';
import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final config = const AppConfig(
    appTitle: 'Bike App',
    flavor: 'development',
  );

  runApp(MyApp(config: config));
}
