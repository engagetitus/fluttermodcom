class Task {
  // properties
  final int id;
  final String title;
  final String description;
  final bool isComplete;

  Task(this.id, this.title, this.description, this.isComplete);

  // Methods
  //1)
  static Task fromDB(Map<String, Object?> data) {
    int id = int.tryParse(data['id'].toString()) ?? 0;
    String title = data['title'].toString();
    String description = data['description'].toString();
    bool isComplete = data['isComplete'] == 1 ? true : false;
    return Task(id, title, description, isComplete);
  }
}
