import 'package:mvvm_provider_ny_times_app/src/core/utils/injections.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/presentation/notifiers/ArticlesNotifier.dart';



ArticlesNotifier get authProvider => ArticlesNotifier(articlesRepository: sl<AbstractArticlesRepository>());
