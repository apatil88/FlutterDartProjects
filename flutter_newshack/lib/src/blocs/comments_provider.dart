import 'package:flutter/material.dart';
import 'comments_bloc.dart';
export 'comments_bloc.dart';

class CommentsProvider extends InheritedWidget {
  final CommentsBloc commentsBloc;

  CommentsProvider({Key key, Widget child})
      : commentsBloc = CommentsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CommentsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CommentsProvider)
            as CommentsProvider)
        .commentsBloc;
  }
}
