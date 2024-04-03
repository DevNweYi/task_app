import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/task_entry.dart';
import 'package:task_app/utils/colors.dart';
import 'package:task_app/database/title/title_table.dart' as title_table;

import 'bloc/task/bloc/task_bloc.dart';
import 'database/app_database.dart';
import 'database/task/task_table.dart';

class TaskList extends StatefulWidget {
  final int titleId;
  const TaskList({super.key, required this.titleId});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  //late final TaskBloc taskBloc;

  @override
  Widget build(BuildContext context) {
    //taskBloc = BlocProvider.of<TaskBloc>(context);

    return Scaffold(
      body: Column(
        children: [
          _topContainer(MediaQuery.of(context).size.width),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                children: [
                  FutureBuilder<title_table.Title?>(
                      future: GetIt.instance
                          .get<AppDatabase>()
                          .titleDao
                          .getTitle(widget.titleId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                              child: _taskTitle(context, snapshot.data!));
                        } else if (snapshot.hasError) {}
                        return CircularProgressIndicator();
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  //Expanded(child: Container(child: _taskList())),
                  StreamBuilder(
                      stream: GetIt.instance
                          .get<AppDatabase>()
                          .taskDao
                          .getTask(widget.titleId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                              child:
                                  Container(child: _taskList(snapshot.data!)));
                        } else if (snapshot.hasError) {}
                        return CircularProgressIndicator();
                      })
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      TaskEntry(titleId: widget.titleId)));
        },
        backgroundColor: secondary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _taskList(List<Task> lstTask) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: lstTask.length,
        itemBuilder: (context, index) {
          Task task = lstTask[index];
          return Slidable(
            key: UniqueKey(),
            startActionPane:
                ActionPane(extentRatio: 0.3, motion: ScrollMotion(), children: [
              SlidableAction(
                onPressed: ((context) {
                  BlocProvider.of<TaskBloc>(context).add(TaskDeleteEvent(task));
                }),
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
                icon: Icons.delete,
                label: 'Delete',
              )
            ]),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.note),
                title: Text(
                  task.taskName!,
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                      const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TaskEntry(
                                titleId: widget.titleId,
                                taskId: task.taskId,
                              )));
                },
              ),
            ),
          );
        });
  }

  Widget _taskTitle(BuildContext context, title_table.Title title) {
    return Row(
      children: [
        Image.asset(
          "assets/images/${title.imageName}",
          width: 50,
          height: 50,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("8 Tasks",
                style: Theme.of(context).textTheme.titleMedium!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey))),
            Text(title.titleName!,
                style: Theme.of(context).textTheme.headlineMedium!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87))),
          ],
        )
      ],
    );
  }

  Widget _topContainer(double screenWidth) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(screenWidth, 200))),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
