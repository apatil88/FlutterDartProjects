import 'package:blog_app_flutter_redux/src/actions/counter_actions.dart';

String titleReducer(String currentTitle, action) {
  if (action is UpdateTitleAction) {
    if (currentTitle != action.title) {
      currentTitle = action.title;
      return currentTitle;
    }
  }
  return currentTitle;
}
