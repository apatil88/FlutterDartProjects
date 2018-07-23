import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../blocs/stories_bloc.dart';

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
          return Text('Still waiting on ids');
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Text('{$snapshot.data[index]}');
          },
        );
      },
    );
  }
}
