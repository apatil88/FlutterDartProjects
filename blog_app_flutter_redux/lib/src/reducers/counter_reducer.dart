import 'package:blog_app_flutter_redux/src/actions/counter_actions.dart';

int counterReducer(int currentCount, action) {
  if (action is IncrementCountAction) {
    currentCount++;
    return currentCount;
  } else {
    return currentCount;
  }
}
