import '../../dtos/pass_dto.dart';
import '../../repositories/pass/pass_repository.dart';
import '../../../domain/model/pass/pass.dart';
import '../../mockup_data.dart';
class PassRepositoryMockup  extends PassRepository{
  @override
  Future<List<Pass>> getAllPasses()async {
    return passes.entries.map((pass) => PassDto.fromJson(pass.key,pass.value)).toList();
  }

}