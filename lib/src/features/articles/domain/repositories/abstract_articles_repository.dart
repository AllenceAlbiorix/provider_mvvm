import 'package:dartz/dartz.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/error/failures.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/articles_params.dart';

abstract class AbstractArticlesRepository {
  // Get Ny Times Articles
  Future<Either<Failure, List<ArticleModel>>> getArticles(
      ArticlesParams params);
}
