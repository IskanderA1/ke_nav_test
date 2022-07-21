import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ke_nav_test/beamer_app/data.dart';
import 'package:ke_nav_test/beamer_app/features/articles/screens/article_detail_screen.dart';
import 'package:ke_nav_test/beamer_app/features/articles/screens/article_screen.dart';

class ArticlesLocation extends BeamLocation<BeamState> {
  ArticlesLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/articles/:articleId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    BeamPage(
      key: const ValueKey('articles'),
      title: 'Articles',
      type: BeamPageType.noTransition,
      child: ArticlesScreen(),
    ),
    if (state.pathParameters.containsKey('articleId'))
      BeamPage(
        key: ValueKey('articles-${state.pathParameters['articleId']}'),
        title: articles.firstWhere((article) =>
        article['id'] == state.pathParameters['articleId'])['title'],
        child: ArticleDetailsScreen(
          article: articles.firstWhere((article) =>
          article['id'] == state.pathParameters['articleId']),
        ),
      ),
  ];
}