class Task {
  String name;
  String deadline;
  String item;
  String memo;
  bool isDone;
  final DateTime createdAt;
  DateTime updatedAt;

  Task({
    this.name,
    this.deadline,
    this.item,
    this.memo,
    this.isDone = false,
    this.createdAt,
    this.updatedAt,
  });
}
