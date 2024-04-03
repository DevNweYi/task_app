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
      emit(TaskInitial());
    });
    on<TaskAddEvent>((event, emit) async {
      await GetIt.instance
          .get<AppDatabase>()
          .taskDao
          .addTask(Task(titleId: event.titleId, taskName: event.task))
          .then((value) {
        emit(TaskAddSuccessState());
      });
    });
    on<TaskEditEvent>((event, emit) async {
      await GetIt.instance
          .get<AppDatabase>()
          .taskDao
          .updateTask(event.task)
          .then((value) {
        emit(TaskEditSuccessState());
      });
    });
     on<TaskDeleteEvent>((event, emit) async {
      await GetIt.instance
          .get<AppDatabase>()
          .taskDao
          .deleteTask(event.task)
          .then((value) {
        emit(TaskDeleteSuccessState());
      });
    });
  }
}
