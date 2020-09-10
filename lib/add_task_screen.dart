import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_prototype2_app/task.dart';
import 'package:todo_prototype2_app/task_view_model.dart';

class AddTaskScreen extends StatelessWidget {
  static String id = 'add_task_screen';
  final Task editTask;
  AddTaskScreen({Key key, this.editTask}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, viewModel, _) {
        return WillPopScope(
          onWillPop: () async {
            viewModel.clear();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(_isEdit() ? '保存したタスク' : 'TODOを追加して整理しよう'),
            ),
            body: ListView(
              children: <Widget>[
                _buildInputField(
                  context,
                  title: 'タイトル',
                  textEditingController: viewModel.nameController,
                  errorText:
                      viewModel.validateName ? viewModel.strValidateName : null,
                  didChanged: (_) {
                    viewModel.updateValidateName();
                  },
                ),
                _buildInputField(
                  context,
                  title: '期日',
                  textEditingController: viewModel.deadlineController,
                  errorText: null,
                ),
                _buildInputField(
                  context,
                  title: '項目',
                  textEditingController: viewModel.itemController,
                  errorText: null,
                ),
                _buildInputField(
                  context,
                  title: 'メモ',
                  textEditingController: viewModel.memoController,
                  errorText: null,
                ),
                _buildAddButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isEdit() {
    return editTask != null;
  }

  void tapAddButton(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context, listen: false);
    viewModel.setValidateName(true);
    if (viewModel.validateTaskName()) {
      _isEdit() ? viewModel.updateTask(editTask) : viewModel.addTask();
      Navigator.of(context).pop();
    }
  }

  Widget _buildInputField(BuildContext context,
      {String title,
      TextEditingController textEditingController,
      String errorText,
      Function(String) didChanged}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle,
          ),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(errorText: errorText),
            onChanged: (value) {
              didChanged(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: RaisedButton(
        onPressed: () => tapAddButton(context),
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            _isEdit() ? '保存' : '決定',
            style:
                Theme.of(context).textTheme.title.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
