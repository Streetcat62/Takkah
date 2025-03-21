import 'package:get_it/get_it.dart';

import '../handlers/handlers.dart';
import '../routes/app_router.gr.dart';
import '../../repository/repository.dart';

final GetIt getIt = GetIt.instance;

void setUpDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<ShopsRepository>(ShopsRepositoryImpl());
  getIt.registerSingleton<CartsRepository>(CartsRepositoryImpl());
  getIt.registerSingleton<OrdersRepository>(OrdersRepositoryImpl());
  getIt.registerSingleton<CatalogRepository>(CatalogRepositoryImpl());
  getIt.registerSingleton<RecipesRepository>(RecipesRepositoryImpl());
  getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  getIt.registerSingleton<SettingsRepository>(SettingsSettingsRepositoryImpl());
}

final appRouter = getIt.get<AppRouter>();
final authRepository = getIt.get<AuthRepository>();
final userRepository = getIt.get<UserRepository>();
final cartRepository = getIt.get<CartsRepository>();
final shopsRepository = getIt.get<ShopsRepository>();
final ordersRepository = getIt.get<OrdersRepository>();
final catalogRepository = getIt.get<CatalogRepository>();
final recipesRepository = getIt.get<RecipesRepository>();
final productsRepository = getIt.get<ProductsRepository>();
final settingsRepository = getIt.get<SettingsRepository>();
