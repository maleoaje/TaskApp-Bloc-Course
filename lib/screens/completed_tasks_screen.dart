import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/models/task_model.dart';
import 'package:flutter_tasks_app/widgets/task_list.dart';

class completedTasksScreen extends StatelessWidget {
  const completedTasksScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  'Completed Tasks: ${state.completedTasks.length}',
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
