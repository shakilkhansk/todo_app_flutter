import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todoAdd.dart';
import 'package:todo_app/todoUpdate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDo> todo = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.separated(itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index+1}'),
          ),
          title: Text(todo[index].title),
          subtitle: Text(todo[index].time),
          trailing: Text(todo[index].status, style: TextStyle(color: todo[index].status=='Success'? Colors.grey: Colors.blue)),
          onLongPress: () {
            showDialog(context: context, builder: (context) {
                return AlertDialog(
                  actions: [
                    ListTile(title: const Text('Update'),leading: const Icon(Icons.edit),onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(context: context, builder: (context) {
                        return ToDoUpdate(initialToDo: todo[index], onUpdate: (updatedToDo) {
                          setState(() {
                            todo[index] = updatedToDo;
                          });
                        },);
                      },isScrollControlled: true);
                    }),
                    const Divider(),
                    ListTile(title: const Text('Delete'),leading: const Icon(Icons.delete),onTap: () {
                      setState(() {
                        todo.removeAt(index);
                        Navigator.pop(context);
                      });
                    }),
                  ],
                );
            },);
          },
        );
      }, separatorBuilder: (context, index) {
        return const Divider();
      }, itemCount: todo.length),
      floatingActionButton: FloatingActionButton(onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
          return ToDoAdd(onSave: (toDo) {
            setState(() {
              todo.add(toDo);
            });
          },);
        },isScrollControlled: true);
      },
        child: const Icon(Icons.add),
      ),
    );
  }
}
