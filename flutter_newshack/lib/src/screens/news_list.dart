import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../blocs/stories_bloc.dart';
import '../widgets/news_list_title.dart';
import '../widgets/refresh.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storiesBloc = StoriesProvider.of(context);

    //Needs some work: Need to change this later.
    storiesBloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top HackNews'),
      ),
      body: buildList(storiesBloc),
    );
  }

  Widget buildList(StoriesBloc storiesBloc) {
    return StreamBuilder(
      stream: storiesBloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Refresh(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              return NewsListTile(
                itemId: snapshot.data[index],
              );
            },
          ),
        );
      },
    );
  }
}
