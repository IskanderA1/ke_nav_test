import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ke_nav_test/beamer_app/features/books/screens/book_detail_screen.dart';

import '../../../data.dart';
import '../screens/book_screen.dart';

class BooksLocation extends BeamLocation<BeamState> {
  BooksLocation([RouteInformation? routeInformation]) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/books/:bookId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('books'),
          title: 'Books',
          type: BeamPageType.noTransition,
          child: BooksScreen(),
        ),
        if (state.pathParameters.containsKey('bookId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['bookId']}'),
            title: books.firstWhere((book) => book['id'] == state.pathParameters['bookId'])['title'],
            child: BookDetailsScreen(
              book: books.firstWhere((book) => book['id'] == state.pathParameters['bookId']),
            ),
          ),
      ];
}

