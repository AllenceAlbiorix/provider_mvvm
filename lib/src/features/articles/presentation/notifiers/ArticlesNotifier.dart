
import 'package:mvvm_provider_ny_times_app/src/core/network/response.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/articles_params.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/presentation/notifiers/base_notifier.dart';

class ArticlesNotifier extends BaseNotifier implements ArticlesProvEvent {
  final AbstractArticlesRepository articlesRepository;

  BaseApiResponse<List<ArticleModel>> articleResponse = BaseApiResponse.loading();

  ArticlesNotifier({required this.articlesRepository});

  @override
  Future<void> getArticles(ArticlesParams params) async {
    try {
       apiResIsLoading(articleResponse);
      final result = await articlesRepository.getArticles(params);

      result.fold(
              (failure) => apiResIsFailed(articleResponse, failure),
              (data) => apiResIsSuccess(articleResponse, data));
    } catch (e) {
      apiResIsFailed(articleResponse, e);
    }
  }
}

abstract class ArticlesProvEvent {
  Future<void> getArticles(ArticlesParams params);
}
