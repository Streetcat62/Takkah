import 'package:get_it/get_it.dart';

import '../handlers/handlers.dart';
import '../interface/interfaces.dart';
import '../../presentation/routes/app_router.gr.dart';
import '../../infrastructure/repositories/repositories.dart';

final GetIt getIt = GetIt.instance;

Future setUpDependencies() async {
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<UsersRepository>(UsersRepositoryImpl());
  getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<OrdersRepository>(OrdersRepositoryImpl());
  getIt.registerSingleton<CatalogRepository>(CatalogRepositoryImpl());
}

final settingsRepository = getIt.get<SettingsRepository>();
final authRepository = getIt.get<AuthRepository>();
final usersRepository = getIt.get<UsersRepository>();
final productRepository = getIt.get<ProductsRepository>();
final appRouter = getIt.get<AppRouter>();
final ordersRepository = getIt.get<OrdersRepository>();
final catalogRepository = getIt.get<CatalogRepository>();
