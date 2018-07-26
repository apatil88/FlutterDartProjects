import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'screens/news_detail.dart';
import 'blocs/stories_provider.dart';
import 'blocs/comments_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'NewsHack',
          onGenerateRoute: routes,
        ),
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

          //Kick off the recursive data fetching process so that we have the item with comments data when the news detail screen loads
          final commentsBloc = CommentsProvider.of(context);
          commentsBloc.fetchItemWithComments(itemId);

          return NewsDetail(
            itemId: itemId,
          );
        },
      );
    }
  }
}
