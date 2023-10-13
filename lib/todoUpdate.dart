import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class ToDoUpdate extends StatefulWidget {
  const ToDoUpdate({super.key, required this.onUpdate, required this.initialToDo});
  final Function(ToDo) onUpdate;
  final ToDo initialToDo;

  @override
  State<ToDoUpdate> createState() => _ToDoUpdateState();
}

class _ToDoUpdateState extends State<ToDoUpdate> {
  final _toDoUpdateController = TextEditingController();
  final _myForm = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _toDoUpdateController.text= widget.initialToDo.title;
  }
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
              const Text('Update Todo',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.close))
            ],
          ),
          const Divider(),
          Form(key: _myForm,child: TextFormField(
            controller: _toDoUpdateController,
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
                ToDo updateToDo = ToDo(title: _toDoUpdateController.text, time: DateTime.now().toString(),status: 'Success');
                widget.onUpdate(updateToDo);
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
