import '../../../domain/model/bike/bike_model.dart';

abstract class BikeRepository {
  Stream<List<Bike>> watchBikes();
}