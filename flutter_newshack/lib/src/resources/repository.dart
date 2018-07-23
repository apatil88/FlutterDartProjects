import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  //list of source
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider()
  ]; //use the single instance of NewsDbProvider

  //list of cache
  List<Cache> caches = <Cache>[
    newsDbProvider, //use the single instance of NewsDbProvider
  ];

  //TODO: Iterate over sources when fetchTopIds() is implemented in NewsDbProvider
  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;

    //Iterate through each source and check if the item exist
    for (source in sources) {
      item = await source.fetchItem(id);

      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      cache.addItem(item);
    }

    return item;
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}
