import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ny_times_app/src/core/router/app_route_enum.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/presentation/pages/article_details_page.dart';
import 'package:ny_times_app/src/features/articles/presentation/pages/articles_page.dart';
import 'package:ny_times_app/src/features/intro/presentation/pages/intro_page.dart';
import 'package:ny_times_app/src/shared/presentation/pages/photo_view_page.dart';
import 'package:ny_times_app/src/shared/presentation/pages/web_view_page.dart';

class AppGoRouter {
  static String currentRoute = AppRouteEnum.intro.path;
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final goRouter = GoRouter(
    initialLocation: currentRoute,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRouteEnum.intro.path,
        name: AppRouteEnum.intro.name,
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        path: AppRouteEnum.articlesPage.path,
        name: AppRouteEnum.articlesPage.name,
        builder: (context, state) => const ArticlesPage(),
      ),
      GoRoute(
        path: AppRouteEnum.articleDetailsPage.path,
        name: AppRouteEnum.articleDetailsPage.name,
        routes: [
          GoRoute(
            path: AppRouteEnum.weViewPage.path,
            name: AppRouteEnum.weViewPage.name,
            builder: (context, state) {
              assert(state.extra != null, "Url is required");
              return WebViewPage(
                link: state.extra as String,
              );
            },
          ),
        ],
        builder: (context, state) {
          assert(state.extra != null, "nyTimesArticleModel is required");
          return ArticleDetailsPage(
            model: state.extra as ArticleModel,
          );
        },
      ),
      GoRoute(
        path: AppRouteEnum.photoViewPage.path,
        name: AppRouteEnum.photoViewPage.name,
        builder: (context, state) {
          Map<String, dynamic>? args = state.extra as Map<String, dynamic>?;
          assert(args != null, "You should pass 'path' and 'fromNet'");
          return PhotoViewPage(
            path: args!['path'],
            fromNet: args['fromNet'],
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.path}'),
      ),
    ),
  );
}
