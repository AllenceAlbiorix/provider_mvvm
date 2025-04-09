import 'package:dio/dio.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/error/exceptions.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/web_service.dart';
import 'package:mvvm_provider_ny_times_app/src/core/utils/constant/network_constant.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/data/data_sources/remote/abstract_article_api.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/articles_params.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/article_model.dart';

class ArticlesImplApi extends AbstractArticleApi {

  CancelToken cancelToken = CancelToken();

   ApiService apiService = ApiService();

  ArticlesImplApi(this.apiService);

  // Articles Method
  @override
  Future<List<ArticleModel>> getArticles(ArticlesParams params) async {
    try {
      final result = (await apiService.get(
        getArticlePath(params.period),
        options: Options(
          headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',}
        )
      ));
      if (result.data == null) throw ServerException("Unknown Error", result.statusCode);

      final List<ArticleModel> articles = (result.data['results'] as List<dynamic> )
          .map((json) => ArticleModel.fromJson(json))
          .toList();

      return articles;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
