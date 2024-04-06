import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';

import 'app_core/api/api_client.dart';
import 'app_core/cubits/network/network_cubit.dart';
import 'app_core/services/network_connection_checker.dart';
import 'app_core/utils/hive_storage_service.dart';
import 'app_core/utils/secure_storage.dart';
import 'features/empty/core/datasources/empty_remote_data_source_impl.dart';
import 'features/empty/core/repository/empty_repository.dart';
import 'features/empty/core/usecases/empty_usecases.dart';

final locator = GetIt.I;

final cacheInterseptorOptions = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.refreshForceCache,
  maxStale: const Duration(days: 7),
  priority: CachePriority.high,
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  allowPostMethod: false,
);

void setup() {
  // ================ Core ================ //

  locator.registerLazySingleton(() => Dio()
    ..interceptors.add(DioCacheInterceptor(options: cacheInterseptorOptions)));
  locator.registerLazySingleton<ApiClient>(
    () => ApiClientImpl(
      locator(),
    ),
  );

  // ================ UseCases ================ //

  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  locator.registerLazySingleton(() => GetTestData(locator()));

  // ================ External ================ //

  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(() => HiveStorageService());

  // ================ BLoC / Cubit ================ //

  locator.registerFactory(() => NetworkCubit(
        locator(),
      ));

  // ================ Repository / Datasource ================ //

  locator.registerLazySingleton<EmptyRepository>(
      () => EmptyRepositoryImpl(locator()));

  // ================ DATASOURCE ================ //

  locator.registerLazySingleton<EmptyRemoteDataSource>(
      () => EmptyRemoteDataSourceImpl(
          // locator()
          ));
}
