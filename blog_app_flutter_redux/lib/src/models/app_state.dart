//Plain Dart class which is the Model for our entire application's state

class AppState {
  final String title;
  final String contents;
  final String category;
  final int count;

  AppState(
      {this.title = "title",
      this.contents = "contents",
      this.category = "post category",
      this.count = 0});

  //Creates a new state with updated values. This prevents directly modifying the current state
  AppState copyWith(
      {String title, String contents, String category, int count}) {
    return AppState(
      title: title ?? this.title,
      contents: contents ?? this.contents,
      category: category ?? this.category,
      count: count ?? this.count,
    );
  }

  String toString() {
    return 'AppState{title: $title, contents: $contents, category: $category, count: $count}';
  }
}
