
import 'package:activa_done/models/task_model.dart';
import 'package:activa_done/views/home_page.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    List tasks = box!.values.toList();
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var task = TaskModel.fromMap(tasks[index]);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                title: Text(
                  task.content,
                  style: TextStyle(
                      decoration: task.done ? TextDecoration.lineThrough : null,
                      color: Colors.white,
                      fontSize: 20),
                ),
                subtitle: Text(
                  task.timestamp.toString(),
                ),
                trailing: Icon(
                  task.done
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined,
                  color: Colors.white,
                ),
                onTap: () {
                  task.done = !task.done;
                  box!.putAt(index, task.toMap());
                  setState(() {});
                },
                onLongPress: () {
                  box!.deleteAt(index);
                  setState(() {});
                },
              ),
            ),
          );
        });
  }
}
