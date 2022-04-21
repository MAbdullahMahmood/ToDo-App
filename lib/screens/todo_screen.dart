import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/screens/widget/AddTodoDialog.dart';
import 'package:todo/screens/widget/todo_list_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
      ),
      body: TodoListWidget(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(context: context,
              builder: (context) => AddTodoDialog(),
              barrierDismissible: true,
          );

        },
      ),
    );
  }
}

