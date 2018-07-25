import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  @override
  Widget build(BuildContext context) {
    final storiesBloc = StoriesProvider.of(context);
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await storiesBloc
            .clearCache(); //Refresh => StoriesBloc => Repository => DbProvider

        await storiesBloc.fetchTopIds();
      },
    );
  }
}
