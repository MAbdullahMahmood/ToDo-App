
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todo_provider.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({
    Key? key,
  }) : super(key: key);


  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {

  String title ='';
  String description ='';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add To Do",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(height: 8,),
                buildTitle(),
                const SizedBox(height: 8,),
                buildDescription(),
                const SizedBox(height: 16,),
                buildButton(),

              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    validator: (title) {
      if (title!.isEmpty) {
        return 'The title cannot be empty';
      }
      return null;
    },
    onChanged: (title) {
      setState(() {
        this.title = title;
      });
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title',
    ),
  );

  Widget buildDescription() => TextFormField(
    maxLines: 3,
    initialValue: description,
    onChanged: (description) {
      setState(() {
        this.description = description;
      });
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description',
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(morangeColor),
      ),
      onPressed: addTodo,
      child: Text('Save'),
    ),
  );

  void addTodo(){

    print('title: $title, Desc: $description');
    if(title.isNotEmpty){
      final todo =  Todo(DateTime.now().toString(), title, description, false);
     final provider = Provider.of<TodosProvider>(this.context, listen: false);
     provider.addTodo(todo);
     Navigator.of(this.context).pop();
    }

  }

}


