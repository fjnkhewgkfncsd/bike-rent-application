import 'package:bike_rental/domain/model/pass/pass.dart';

abstract class PassRepository {
  Future<List<Pass>> getAllPasses();
}