class TaskModel {
  String content;
  DateTime timestamp;
  bool done;
  TaskModel({
    required this.content,
    required this.timestamp,
    required this.done,
  });

  factory TaskModel.fromMap(Map task) {
    return TaskModel(
        content: task['content'],
        timestamp: task['timestamp'],
        done: task['done']);
  }

  Map toMap() {
    return {
      'content': content,
      'timestamp': timestamp,
      'done': done,
    };
  }
}
