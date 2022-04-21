import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todo_provider.dart';

import '../../Utils.dart';


class TodoWidget extends StatelessWidget {
  final Todo? todo;

  const TodoWidget({
    Key? key,
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child:  buildTodo(context),
  );

  Widget buildTodo(BuildContext context) => GestureDetector(
    //onTap: () => editTodo(context, todo),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(

        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: todo!.isDone,
            onChanged: (_) {
              final provider =
              Provider.of<TodosProvider>(context, listen: false);
              final isDone = provider.toggleTodoStatus(todo!);

              Utils.showSnackBar(
                context,
                isDone ? 'Task completed' : 'Task marked incomplete',
              );
            },
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo!.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                ),
                if (todo!.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo!.description,
                      style: TextStyle(fontSize: 18, height: 1.5),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    ),
  );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }


}