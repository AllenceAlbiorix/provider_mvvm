import 'package:get_it/get_it.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/dio_network.dart';
import 'package:mvvm_provider_ny_times_app/src/core/utils/log/app_logger.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/articles_injections.dart';
import 'package:mvvm_provider_ny_times_app/src/shared/app_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/web_service.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await initAppInjections();
  await initDioInjections();
  await initArticlesInjections();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> initDioInjections() async {
  initRootLogger();
  sl.registerSingleton<DioNetwork>(DioNetwork());
  sl.registerSingleton<ApiService>(ApiService());
  // DioNetwork.initDio();
}
