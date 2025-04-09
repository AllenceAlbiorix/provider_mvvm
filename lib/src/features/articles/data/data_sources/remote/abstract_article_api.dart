import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/articles_params.dart';

abstract class AbstractArticleApi {
  // Get all article
  Future<List<ArticleModel>> getArticles(
      ArticlesParams params);
}
