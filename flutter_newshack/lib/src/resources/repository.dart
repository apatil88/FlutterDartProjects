import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();

  Future<List<int>> fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);

    //If we already fetched this item before
    if (item != null) {
      return item;
    }

    //If we did not find the item in the database, make the API request
    item = await apiProvider.fetchItem(id);

    //Add the fetched item to the db
    dbProvider.addItem(item);

    return item;
  }
}
