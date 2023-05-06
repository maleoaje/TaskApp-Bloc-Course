import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/models/task_model.dart';
import 'package:flutter_tasks_app/screens/edit_task_screen.dart';
import 'package:flutter_tasks_app/widgets/pop_up.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: EditTasksScreen(oldTask: task),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null),
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy hh:mm')
                          .format(DateTime.parse(task.date)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: task.isDone,
                  onChanged: task.isDeleted == false
                      ? (value) {
                          context.read<TasksBloc>().add(
                                UpdateTask(task: task),
                              );
                        }
                      : null),
              PopUpMnu(
                task: task,
                cancelOrDeleteCallback: () =>
                    _removeOrDeleteTask(context, task),
                likeOrDislike: () => context.read<TasksBloc>().add(
                      MarkFavoriteOrUnfavoriteTask(task: task),
                    ),
                editTask: () {
                  Navigator.of(context).pop();
                  _editTask(context);
                },
                restoreTaskCallBack: () => context.read<TasksBloc>().add(
                      RestoreTask(task: task),
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ListTile(
//         title: Text(
//           task.title,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//               decoration: task.isDone! ? TextDecoration.lineThrough : null),
//         ),
//         trailing: task.isDeleted == false
//             ? Checkbox(
//                 value: task.isDone,
//                 onChanged: (value) {
//                   context.read<TasksBloc>().add(
//                         UpdateTask(task: task),
//                       );
//                 },
//               )
//             : null,
//         onLongPress: () => _removeOrDeleteTask(context, task));
