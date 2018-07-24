import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  //Decode JSON coming from API response and put in Model class
  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'] ??
            false, //if parsedJson['deleted']=null then default to false
        type = parsedJson['type'],
        by = parsedJson['by'],
        time = parsedJson['time'],
        text = parsedJson['text'] ?? '',
        dead = parsedJson['dead'] ??
            false, //if parsedJson['dead']=null then default to false
        parent = parsedJson['parent'],
        kids = parsedJson['kids'] ?? [],
        url = parsedJson['url'],
        score = parsedJson['score'],
        title = parsedJson['title'],
        descendants = parsedJson['descendants'] ?? 0;

  //Massage response from Db for certain fields
  ItemModel.fromDb(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'] ==
            1, //if parsedJson['deleted'] = 1, deleted = true. Note db stores either 1 or 0 in deleted column
        type = parsedJson['type'],
        by = parsedJson['by'],
        time = parsedJson['time'],
        text = parsedJson['text'],
        dead = parsedJson['dead'] == 1,
        parent = parsedJson['parent'],
        kids = jsonDecode(parsedJson['kids']),
        url = parsedJson['url'],
        score = parsedJson['score'],
        title = parsedJson['title'],
        descendants = parsedJson['descendants'];

  //Convert the ItemModel instance into Map<String,dynamic> before storing in db.
  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'by': by,
      'time': time,
      'text': text,
      'parent': parent,
      'url': url,
      'score': score,
      'title': title,
      'descendants': descendants,
      'deleted': deleted ? 1 : 0, //value massaged for storing in Db
      'dead': dead ? 1 : 0, //value massaged for storing in Db
      'kids': jsonEncode(kids) //value massaged for storing in Db
    };
  }
}
