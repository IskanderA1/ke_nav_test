import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ke_nav_test/beamer_app/data.dart';
import 'package:ke_nav_test/beamer_app/router/router.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView(
        children: books
            .map(
              (book) => ListTile(
                title: Text(book['title']!),
                subtitle: Text(book['author']!),
                onTap: () => context.beamToNamed('/books/${book['id']}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
