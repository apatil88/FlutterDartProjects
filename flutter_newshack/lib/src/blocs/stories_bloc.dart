import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>(); //StreamController

  //Getters to Streams
  Observable<List<int>> get topIds => _topIds.stream;

  //Get list of Ids from the Repository and add it to the sink on our topIds StreamController
  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
  }
}
