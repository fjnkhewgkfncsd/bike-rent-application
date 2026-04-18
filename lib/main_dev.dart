import 'package:bike_rental/ui/state/user_state.dart';
import 'data/repositories/bike/bike_repository.dart';
import 'data/repositories/bike/bike_repository_mockup.dart';
import 'data/repositories/pass/pass_repository.dart';
import 'data/repositories/pass/pass_repository_mockup.dart';
import 'data/repositories/slot/slot_repository.dart';
import 'data/repositories/slot/slot_repository_mockup.dart';
import 'data/repositories/station/station_repository.dart';
import 'data/repositories/user/user_repository.dart';
import 'data/repositories/user/user_repository_mockup.dart';
import 'data/repositories/station/station_repository_mockup.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import './main_common.dart';

List<SingleChildWidget> get providers {
  return [
    Provider<UserRepository>(
      create: (_) => UserRepositoryMockup(),
    ),
    Provider<PassRepository>(
      create: (_) => PassRepositoryMockup(),
    ),
    Provider<BikeRepository>(
      create: (_) => BikeRepositoryMockup(),
    ),
    Provider<StationRepository>(
      create: (_) => StationRepositoryMockup(),
    ),
    Provider<SlotRepository>(
      create: (_) => SlotRepositoryMockup(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserState(
        userRepository: context.read<UserRepository>(),
      )..loadUser('001'),
    ),
  ];
}

void main() {
  mainCommon(providers);
}