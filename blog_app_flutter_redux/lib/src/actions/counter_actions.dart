class IncrementCountAction {}

class UpdateTitleAction {
  final String title;

  UpdateTitleAction({this.title});

  @override
  String toString() {
    return 'UpdateTitle{title: $title}';
  }
}

class UpdateContentAction {
  final String content;

  UpdateContentAction({this.content});

  @override
  String toString() {
    return 'UpdateContent{content: $content}';
  }
}

class UpdateCategoryAction {
  final String category;

  UpdateCategoryAction({this.category});

  @override
  String toString() {
    return 'UpdateCategory{category: ${category}';
  }
}
