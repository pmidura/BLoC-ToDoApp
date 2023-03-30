import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../widgets/tasks_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) => BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Recycle Bin'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            drawer: const MyDrawer(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      'Tasks: ${state.removedTasks.length}',
                    ),
                  ),
                ),
                TasksList(tasksList: state.removedTasks),
              ],
            ),
          );
        },
      );
}
