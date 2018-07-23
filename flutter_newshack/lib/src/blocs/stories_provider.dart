import 'package:flutter/material.dart';
import 'stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc storiesBloc;

  StoriesProvider({Key key, Widget child})
      : storiesBloc = StoriesBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  //Return the StoriesBloc instance to any widget in the widget hierarchy that wants access to the StoriesBloc instance.
  //context here is the Widget context in the Widget hierarchy where we want access to the StoriesBloc instance
  //Go up the Widget hierachy until we find the StoriesProvider and return the reference to the StoriesBloc tied to the StoriesProvider
  static StoriesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StoriesProvider)
            as StoriesProvider)
        .storiesBloc;
  }
}
