import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'screens/news_detail.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'NewsHack',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return NewsList();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          final itemId = int.parse(settings.name
              .replaceFirst('/', '')); //parse /id to grab just the id
          return NewsDetail(
            itemId: itemId,
          );
        },
      );
    }
  }
}
