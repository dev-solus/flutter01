import 'package:fultter01/core/services/uow_service.dart';
import 'package:get_it/get_it.dart';

import 'components/login/login_service.dart';
import 'core/services/user_service.dart';

final inject = GetIt.instance;

void setupLocator() {
  // GetIt.I.registerLazySingleton(() =>UowService());
  inject.registerLazySingleton(() => UowService());

  // inject.registerLazySingleton(() => UowService());
}
