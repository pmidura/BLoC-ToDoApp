import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key, required this.oldTask});

  final Task oldTask;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: oldTask.title);
    TextEditingController descriptionController = TextEditingController(text: oldTask.description);

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Edit Task',
            style: TextStyle(fontSize: 24),
          ),
    
          const SizedBox(height: 10),
    
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),

              ElevatedButton(
                onPressed: () {
                  var editedTask = Task(
                    title: titleController.text,
                    description: descriptionController.text,
                    id: oldTask.id,
                    isDone: false,
                    isFavorite: oldTask.isFavorite,
                    date: DateTime.now().toString(),
                  );

                  context.read<TasksBloc>().add(EditTask(oldTask: oldTask, newTask: editedTask));
              
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
