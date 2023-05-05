import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_tasks_app/screens/tasks_screen.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            decoration: const BoxDecoration(color: Colors.blueAccent),
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(TasksScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text("${state.allTasks.length}"),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
