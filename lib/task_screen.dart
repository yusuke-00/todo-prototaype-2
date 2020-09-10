import 'package:flutter/material.dart';
import 'package:todo_prototype2_app/add_task_screen.dart';
import 'package:todo_prototype2_app/chart_page.dart';
import 'package:todo_prototype2_app/task_list_view.dart';

class TaskScreen extends StatelessWidget {
  static String id = 'task_screen';

  get provider => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('今週のTODO'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'メニュー',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(color: Colors.cyan),
            ),
            ListTile(
              title: Text('種類別TODO'),
              onTap: () {
                //種類別TODO押したらそのページにいくようにする
              },
            ),
            ListTile(
              title: Text('期限別TODO'),
              onTap: () {
                //ページいくようにする
              },
            ),
            ListTile(
              title: Text('完了チャート'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChartPage.withSampleData()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: TaskListView(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );
          },
          child: Icon(Icons.mode_edit)),
    );
  }
}
