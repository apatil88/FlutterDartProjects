import 'package:flutter_newshack/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns a list of IDs', () async {
    final newsApi = NewsApiProvider();

    //Override the newsApi client with our fake client
    newsApi.client = MockClient((Request request) async {
      return Response(json.encode([10, 20, 30, 40, 50]), 200);
    });

    final fakeIds = await newsApi
        .fetchTopIds(); //Calls our Mocked endpoint. MockClient.get()

    expect(fakeIds, [10, 20, 30, 40, 50]);
  });

  test('FetchItem returns a ItemModel', () async {
    final newsApi = NewsApiProvider();
    final jsonMap = {'id': 123};

    newsApi.client = MockClient((Request request) async {
      return Response(json.encode(jsonMap), 200);
    });

    final fakeItem = await newsApi
        .fetchItem(1000); //Calls our Mocked endpoint. MockClient.get()

    expect(fakeItem.id, 123);
  });
}
