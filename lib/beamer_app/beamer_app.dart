import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:ke_nav_test/beamer_app/features/articles/navigator/location.dart';
import 'package:ke_nav_test/beamer_app/features/books/navigator/locatrion.dart';
import 'package:ke_nav_test/beamer_app/router/router.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late int currentIndex;

  final routerDelegates = [
    BeamerDelegate(
      initialPath: '/books',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('books')) {
          return BooksLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/articles',
      updateParent: true,
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('articles')) {
          return ArticlesLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    currentIndex = uriString.contains('books') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          Beamer(
            routerDelegate: routerDelegates[0],
          ),
          Beamer(
            routerDelegate: routerDelegates[1],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(label: 'Books', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'Articles', icon: Icon(Icons.article)),
        ],
        onTap: (index) {
          if (index != currentIndex) {
            setState(() => currentIndex = index);
            routerDelegates[currentIndex].update(rebuild: false);
          }
        },
      ),
    );
  }
}

class BeamerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
    );
  }
}