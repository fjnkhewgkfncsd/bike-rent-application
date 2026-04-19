import 'package:bike_rental/data/repositories/pass/pass_firebase_repository.dart';
import 'package:bike_rental/data/repositories/slot/slot_firebase_repository.dart';
import 'package:bike_rental/data/repositories/station/station_firebase_repository.dart';
import 'package:bike_rental/data/repositories/user/user_firebase_repository.dart';
import 'package:bike_rental/ui/state/user_state.dart';
import 'data/repositories/bike/bike_repository.dart';
import 'data/repositories/bike/bike_repository_mockup.dart';
import 'data/repositories/pass/pass_repository.dart';
import 'data/repositories/slot/slot_repository.dart';
import 'data/repositories/station/station_repository.dart';
import 'data/repositories/user/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import './main_common.dart';
import 'package:firebase_database/firebase_database.dart';

List<SingleChildWidget> get providers {
  return [
    Provider<FirebaseDatabase>(
      create: (_) => FirebaseDatabase.instance,
    ),
    Provider<UserRepository>(
      create: (context) => UserFirebaseRepository(context.read<FirebaseDatabase>()),
    ),
    Provider<PassRepository>(
      create: (context) => PassFirebaseRepository(context.read<FirebaseDatabase>()),
    ),
    Provider<BikeRepository>(
      create: (_) => BikeRepositoryMockup(),
    ),
    Provider<StationRepository>(
      create: (context) => StationFirebaseRepository(context.read<FirebaseDatabase>()),
    ),
    Provider<SlotRepository>(
      create: (context) => SlotFirebaseRepository(context.read<FirebaseDatabase>()),
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