import 'package:bike_rental/data/dtos/pass_dto.dart';
import 'package:bike_rental/data/repositories/pass/pass_repository.dart';
import 'package:bike_rental/domain/model/pass/pass.dart';
import '../../mockup_data.dart';
class PassRepositoryMockup  extends PassRepository{
  @override
  Future<List<Pass>> getAllPasses()async {
    return passes.entries.map((pass) => PassDto.fromJson(pass.key,pass.value)).toList();
  }

}