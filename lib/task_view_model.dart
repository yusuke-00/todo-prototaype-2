import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_prototype2_app/task.dart';

class TaskViewModel extends ChangeNotifier {
  String get editingName => nameController.text;
  String get editingDeadline => deadlineController.text;
  String get editingItem => itemController.text;
  String get editingMemo => memoController.text;
  TextEditingController nameController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController memoController = TextEditingController();
  String _strValidateName = '';
  String get strValidateName => _strValidateName;
  bool _validateName = false;
  bool get validateName => _validateName;

  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  bool validateTaskName() {
    if (editingName.isEmpty) {
      _strValidateName = 'TODOを追加してみよう！';
      notifyListeners();
      return false;
    } else {
      _strValidateName = '';
      _validateName = false;
      return true;
    }
  }

  void setValidateName(bool value) {
    _validateName = value;
  }

  void updateValidateName() {
    if (validateName) {
      validateTaskName();
      notifyListeners();
    }
  }

  void addTask() {
    final newTask = Task(
      name: nameController.text,
      deadline: deadlineController.text,
      item: itemController.text,
      memo: memoController.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _tasks.add(newTask);
    clear();
  }

  void updateTask(Task updateTask) {
    var updateIndex = _tasks.indexWhere((task) {
      return task.createdAt == updateTask.createdAt;
    });
    updateTask.name = nameController.text;
    updateTask.deadline = deadlineController.text;
    updateTask.item = itemController.text;
    updateTask.memo = memoController.text;
    updateTask.updatedAt = DateTime.now();
    _tasks[updateIndex] = updateTask;
    clear();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleDone(int index, bool isDone) {
    var task = _tasks[index];
    task.isDone = isDone;
    _tasks[index] = task;
    notifyListeners();
  }

  void clear() {
    nameController.clear();
    deadlineController.clear();
    itemController.clear();
    memoController.clear();
    _validateName = false;
    notifyListeners();
  }
}
