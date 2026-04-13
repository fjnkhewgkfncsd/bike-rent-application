import '../../../domain/model/pass/pass.dart';

abstract class PassRepository {
  Future<List<Pass>> getAllPasses();
}