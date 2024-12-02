import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/response.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/models/articles_params.dart';
import 'package:mvvm_provider_ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';

class ArticlesNotifier extends ArticlesProvEvent with ChangeNotifier {
  final AbstractArticlesRepository articlesRepository;
  bool _loginLoading = false;
  BaseApiResponse<List<ArticleModel>> response = BaseApiResponse.loading();

  bool get loginLoading => _loginLoading;

  set loginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  ArticlesNotifier({required this.articlesRepository});

  @override
  Future<void> getArticles(ArticlesParams params) async {
    response = BaseApiResponse.loading();
    notifyListeners();
    final result = await articlesRepository.getArticles(params);
    result.fold((l) {}, (r) {
      response = BaseApiResponse.completed(r);
      notifyListeners();
    });
  }
}

abstract class ArticlesProvEvent {
  Future<void> getArticles(ArticlesParams params);
}
