import 'package:activa_done/models/task_model.dart';
import 'package:activa_done/widgets/task_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

late double deviceHeight, deviceWidth;
String? newTaskContent;
Box? box;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepblue[200],
      appBar: AppBar(
        toolbarHeight: deviceHeight * 0.12,
        title: Text(
          'Activa Done',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepblue,
        foregroundColor: Colors.white,
      ),
      body: taskView(),
      floatingActionButton: addTaskButton(),
    );
  }

  Widget addTaskButton() {
    return FloatingActionButton(
      onPressed: displaytaskpopup,
      backgroundColor: Colors.cyanAccent,
      child: Icon(Icons.add),
    );
  }

  void displaytaskpopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Task!'),
          content: TextField(
            onSubmitted: (value) {
              if (newTaskContent != null) {
                var task = TaskModel(
                    content: newTaskContent!,
                    timestamp: DateTime.now(),
                    done: false);
                box!.add(task.toMap());
                setState(() {
                  newTaskContent = null;
                  Navigator.pop(context);
                });
              }
            },
            onChanged: (value) {
              setState(() {
                newTaskContent = value;
              });
            },
          ),
        );
      },
    );
  }
}
