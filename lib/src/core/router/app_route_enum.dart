enum AppRouteEnum { articlesPage, articleDetailsPage, weViewPage, photoViewPage, intro }

extension AppRouteExtension on AppRouteEnum {
  String get path {
    switch (this) {
      case AppRouteEnum.intro:
        return "/intro";

      case AppRouteEnum.articlesPage:
        return "/articles_page";

      case AppRouteEnum.articleDetailsPage:
        return "/article_details_page";

      case AppRouteEnum.weViewPage:
        return "/web_view_page";

      case AppRouteEnum.photoViewPage:
        return "/photo_view_page";

      default:
        return "/articles_page";
    }
  }

  String get name {
    return this.path.replaceAll("/", "");
  }
}
