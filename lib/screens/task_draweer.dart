import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_tasks_app/screens/tab_screen.dart';

class TaskDrawer extends StatelessWidget {
  TaskDrawer({Key? key}) : super(key: key);

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            decoration: const BoxDecoration(color: Colors.grey),
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text("${state.pendingTasks.length}"),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            },
          )
        ],
      ),
    );
  }
}
