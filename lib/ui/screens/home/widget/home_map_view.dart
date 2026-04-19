// ui/screens/home/widgets/home_map_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_model.dart';
import '../../station/station_screen.dart'; // Import the detail screen
import '../../../../domain/model/station/station.dart';
import '../../../theme/theme.dart';

class HomeMapView extends StatelessWidget {

  const HomeMapView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeModel = context.watch<HomeViewModel>();

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/map.jpg', fit: BoxFit.cover),
        ),

        ...homeModel.stations.map(
          (station) => Positioned(
            left: _getXPosition(context, station.id),
            top: _getYPosition(context, station.id),
            child: GestureDetector(
              onTap: () => _navigateToStationDetail(context, station),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: station.availableBikes > 0
                      ? AppColors.info
                      : Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '${station.availableBikes}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _getXPosition(BuildContext context, String stationId) {
    final screenWidth = MediaQuery.of(context).size.width;

    switch (stationId) {
      case '001':
        return screenWidth * 0.7;
      case '002':
        return screenWidth * 0.2;
      case '003':
        return screenWidth * 0.15;
      case '004':
        return screenWidth * 0.5;
      case '005':
        return screenWidth * 0.35;
      default:
        return screenWidth * 0.5;
    }
  }

  double _getYPosition(BuildContext context, String stationId) {
    final screenHeight = MediaQuery.of(context).size.height;

    switch (stationId) {
      case '001':
        return screenHeight * 0.2;
      case '002':
        return screenHeight * 0.3;
      case '003':
        return screenHeight * 0.6;
      case '004':
        return screenHeight * 0.65;
      case '005':
        return screenHeight * 0.65;
      default:
        return screenHeight * 0.5;
    }
  }

  void _navigateToStationDetail(BuildContext context, Station station) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationScreen(station: station),
      ),
    );
  }
}
