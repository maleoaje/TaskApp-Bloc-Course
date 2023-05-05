import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/screens/task_draweer.dart';
import 'package:flutter_tasks_app/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {
                  // _addTask(context);
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: TaskDrawer(),
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
              TaskList(tasklist: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
