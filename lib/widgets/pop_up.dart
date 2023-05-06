import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/models/task_model.dart';

class PopUpMnu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislike;
  final VoidCallback editTask;
  const PopUpMnu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.task,
    required this.likeOrDislike,
    required this.editTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: editTask,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                    onTap: editTask,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: task.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false
                            ? const Text('Add to Bookmarks')
                            : const Text('Remove from Bookmarks')),
                    onTap: likeOrDislike,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: () {
                        cancelOrDeleteCallback;
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                    onTap: cancelOrDeleteCallback,
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore'),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: () {
                        cancelOrDeleteCallback;
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete Forever'),
                    ),
                    onTap: cancelOrDeleteCallback,
                  ),
                ]);
  }
}
