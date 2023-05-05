import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/models/task_model.dart';
import 'package:flutter_tasks_app/widgets/task_list.dart';

class pendingTasksScreen extends StatelessWidget {
  const pendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  'Pending Tasks: ${state.pendingTasks.length}',
                ),
              ),
            ),
            TaskList(tasklist: tasksList)
          ],
        );
      },
    );
  }
}
