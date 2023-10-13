import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class ToDoAdd extends StatefulWidget {
  const ToDoAdd({super.key, required this.onSave});
  final Function(ToDo) onSave;

  @override
  State<ToDoAdd> createState() => _ToDoAddState();
}

class _ToDoAddState extends State<ToDoAdd> {
  final _toDoAddController = TextEditingController();
  final _myForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16,10,16,MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Create New Todo',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.close))
            ],
          ),
          const Divider(),
          Form(key: _myForm,child: TextFormField(
            controller: _toDoAddController,
            maxLines: 4,
            textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
            validator: (value) {
              if(value!.trim().isEmpty){
                return 'This field is required';
              }
            },
            ),),
          const SizedBox(height: 16,),
          SizedBox(height: 40,width: double.infinity,child: ElevatedButton(
            onPressed: () {
              if(_myForm.currentState!.validate()){
                ToDo todo = ToDo(title: _toDoAddController.text.trim(), time: DateTime.now().toString());
                widget.onSave(todo);
                Navigator.pop(context);
              }
            },
            child: const Text('SAVE'),
          ),),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
