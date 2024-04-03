import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/bloc/task/bloc/task_bloc.dart';
import 'package:task_app/database/task/task_table.dart';
import 'package:task_app/utils/colors.dart';
import 'package:task_app/database/title/title_table.dart' as title_table;

import 'database/app_database.dart';

class TaskEntry extends StatefulWidget {
  final int titleId;
  final int? taskId;
  const TaskEntry({super.key, required this.titleId, this.taskId});

  @override
  State<TaskEntry> createState() => _TaskEntryState();
}

class _TaskEntryState extends State<TaskEntry> {
  //late final TaskBloc taskBloc;
  final TextEditingController _taskInputController = TextEditingController();

  @override
  void initState() {
    if (widget.taskId != null) {
      GetIt.instance
          .get<AppDatabase>()
          .taskDao
          .getTaskByTaskID(widget.taskId!)
          .then((value) {
        _taskInputController.text = value!.taskName!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //taskBloc = BlocProvider.of<TaskBloc>(context);

    return Scaffold(
      body: Column(
        children: [
          _topContainer(context, MediaQuery.of(context).size.width),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 10),
            child: Column(
              children: [
                BlocListener<TaskBloc, TaskState>(
                  listener: (context, state) {
                    if (state is TaskAddSuccessState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Added")));
                    }
                    if (state is TaskEditSuccessState) {
                      Navigator.pop(context);
                    }
                  },
                  child: BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                    if (state is TaskAddSuccessState) {
                      _taskInputController.text = "";
                      BlocProvider.of<TaskBloc>(context).add(TaskInitialEvent());
                    }
                    return TextField(
                        controller: _taskInputController,
                        cursorColor: secondary,
                        autofocus: true,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primary, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primary, width: 1)),
                          hintText: 'Enter a new task',
                          labelText: 'Enter Task',
                          labelStyle: TextStyle(color: Colors.black87),
                        ));
                  }),
                ),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.taskId == null
                          ? BlocProvider.of<TaskBloc>(context).add(TaskAddEvent(
                              widget.titleId, _taskInputController.text))
                          : BlocProvider.of<TaskBloc>(context).add(TaskEditEvent(Task(
                              taskId: widget.taskId,
                              titleId: widget.titleId,
                              taskName: _taskInputController.text)));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: secondary,
                        padding: const EdgeInsets.only(
                            top: 20, left: 40, right: 40, bottom: 20)),
                    child: widget.taskId == null
                        ? const Text("Add")
                        : const Text("Edit"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _taskInputController.dispose();
    super.dispose();
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
                    .getTitle(widget.titleId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String title;
                    title = (widget.taskId == null
                        ? "New Task for ${snapshot.data!.titleName}"
                        : snapshot.data!.titleName)!;
                    return Expanded(
                      child: Align(
                        child: Text(title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87))),
                      ),
                    );
                  } else if (snapshot.hasError) {}
                  return const CircularProgressIndicator();
                }),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
