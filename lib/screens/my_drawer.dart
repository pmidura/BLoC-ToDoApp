import 'package:bloc_to_do_app/screens/recycle_bin.dart';
import 'package:bloc_to_do_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                color: Colors.grey,
                child: Text(
                  'Task Drawer',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),

              BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                    child: ListTile(
                      leading: const Icon(Icons.folder_special),
                      title: const Text('My Tasks'),
                      trailing: Text('${state.pendingTasks.length} | ${state.completedTasks.length}'),
                    ),
                  );
                },
              ),

              const Divider(),
              
              BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                    child: ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text('Bin'),
                      trailing: Text('${state.removedTasks.length}'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}
