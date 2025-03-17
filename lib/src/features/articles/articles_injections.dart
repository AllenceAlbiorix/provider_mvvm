import 'package:mvvm_provider_ny_times_app/src/core/network/web_service.dart';
import 'package:mvvm_provider_ny_times_app/src/core/utils/injections.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/data/data_sources/remote/articles_impl_api.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';

import 'data/data_sources/local/articles_shared_prefs.dart';
import 'data/repositories/articles_repo_impl.dart';

initArticlesInjections() {
  sl.registerSingleton<ArticlesImplApi>(ArticlesImplApi(sl<ApiService>()));
  sl.registerSingleton<AbstractArticlesRepository>(ArticlesRepositoryImpl(sl()));
  sl.registerSingleton<ArticlesSharedPrefs>(ArticlesSharedPrefs(sl()));

}
