import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:blog_app_flutter_redux/src/models/app_state.dart';
import 'package:redux/redux.dart';

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel viewModel) {
        return Text(
          viewModel.count
              .toString(), //_ViewModel watches the count piece of state. This widget will be re-rendered when count piece of state changes
          style: Theme.of(context).textTheme.display1,
        );
      },
    );
  }
}

class _ViewModel {
  //We want to watch how many times the post was updated
  final int count;

  _ViewModel({this.count});

  //This will enable us to use the count in our Text widget above. Whatever is returned here will be accessible on the _ViewModel instance.
  //For instance, we can now do viewModel.count
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(count: store.state.count);
  }
}
