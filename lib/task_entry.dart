import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/bloc/task/bloc/task_bloc.dart';
import 'package:task_app/utils/colors.dart';
import 'package:task_app/database/title/title_table.dart' as title_table;

import 'database/app_database.dart';

class TaskEntry extends StatelessWidget {
  final int titleId;
  const TaskEntry({super.key, required this.titleId});

  @override
  Widget build(BuildContext context) {
    final TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    TextEditingController taskInputController=TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          _topContainer(context, MediaQuery.of(context).size.width),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 10),
            child: Column(
              children: [
                TextField(
                  controller: taskInputController,
                    cursorColor: secondary,
                    autofocus: true,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary, width: 1)),
                      hintText: 'Enter a new task',
                      labelText: 'New Task',
                      labelStyle: TextStyle(color: Colors.black87),
                    )),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      taskBloc.add(TaskAddEvent(titleId, taskInputController.text));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: secondary,
                        padding: EdgeInsets.only(
                            top: 20, left: 40, right: 40, bottom: 20)
                        // fixedSize: Size(MediaQuery.of(context).size.width, 60)
                        ),
                    child: const Text("Add"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _topContainer(BuildContext context, double screenWidth) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(screenWidth, 200))),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            FutureBuilder<title_table.Title?>(
                future: GetIt.instance
                    .get<AppDatabase>()
                    .titleDao
                    .getTitle(titleId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Align(
                    child: Text("New Task for ${snapshot.data!.titleName}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .merge(const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87))),
                      ),
                    );
                  } else if (snapshot.hasError) {}
                  return CircularProgressIndicator();
                }),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
