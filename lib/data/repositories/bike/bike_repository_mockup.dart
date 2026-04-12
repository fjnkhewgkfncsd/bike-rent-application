import 'dart:async';
import 'package:bike_rental/data/dtos/bike_dto.dart';

import '../../mockup_data.dart';
import './bike_repository.dart';
import 'package:bike_rental/domain/model/bike/bike_model.dart';

class BikeRepositoryMockup extends BikeRepository {
  final StreamController<List<Bike>> _controller =
      StreamController<List<Bike>>.broadcast();

  final List<Bike> _bikes = bikes.entries.map((bike) => BikeDto.fromJson(bike.key, bike.value)).toList();

  @override
  Stream<List<Bike>> watchBikes() async* {
    yield List.unmodifiable(_bikes);
    yield* _controller.stream;
  }

  void updateBikeAvailability(String bikeId, bool isAvailable) {
    for (var bike in _bikes) {
      if (bike.id == bikeId) {
        final updatedBike = bike.copyWith(isAvailable: isAvailable);
        _bikes[_bikes.indexOf(bike)] = updatedBike;
        break;
      }
    }
    _controller.add(List.unmodifiable(_bikes));
  }

  void dispose() {
    _controller.close();
  }
}