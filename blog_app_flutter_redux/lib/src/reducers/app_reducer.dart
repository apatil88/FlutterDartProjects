import 'package:blog_app_flutter_redux/src/models/app_state.dart';
import 'counter_reducer.dart';
import 'title_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    count: counterReducer(state.count, action),
    title: titleReducer(state.title, action),
  );
}
