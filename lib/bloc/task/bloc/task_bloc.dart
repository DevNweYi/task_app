import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:task_app/database/task/task_table.dart';

import '../../../database/app_database.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TaskAddEvent>((event, emit) {
      GetIt.instance.get<AppDatabase>().taskDao.addTask(
          Task(taskId: 0, titleId: event.titleId, taskName: event.task));
    });
  }
}
