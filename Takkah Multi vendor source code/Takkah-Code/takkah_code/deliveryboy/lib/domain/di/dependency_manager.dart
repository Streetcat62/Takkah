import 'package:get_it/get_it.dart';

import '../../infrastructure/repositories/order_repository_impl.dart';
import '../../infrastructure/repositories/repositories.dart';
import '../../presentation/routes/app_router.gr.dart';
import '../handlers/handlers.dart';
import '../interface/interfaces.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  getIt.registerSingleton<DrawRepository>(DrawRepositoryImpl());
  getIt.registerSingleton<OrdersRepository>(OrdersRepositoryImpl());
  getIt.registerSingleton<AppRouter>(AppRouter());
}

final settingsRepository = getIt.get<SettingsRepository>();
final authRepository = getIt.get<AuthRepository>();
final userRepository = getIt.get<UserRepository>();
final drawRepository = getIt.get<DrawRepository>();
final orderRepository = getIt.get<OrdersRepository>();
final appRouter = getIt.get<AppRouter>();
