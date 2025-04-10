import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/error/exceptions.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/error/failures.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/data/data_sources/remote/articles_impl_api.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/articles_params.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';

class ArticlesRepositoryImpl extends AbstractArticlesRepository {
  final ArticlesImplApi articlesApi;

  ArticlesRepositoryImpl(this.articlesApi,);

  // Gent Ny Times Articles
  @override
  Future<Either<Failure, List<ArticleModel>>> getArticles(ArticlesParams params) async {
    debugPrint("Called this time");
    try {
      final result = await articlesApi.getArticles(params);
      return Right(result );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
