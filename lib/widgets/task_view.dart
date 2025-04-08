
import 'package:activa_done/views/home_page.dart';
import 'package:activa_done/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Widget taskView() {
  return FutureBuilder(
      future: Hive.openBox('tasks'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          box = snapshot.data;
          return TaskList();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}
