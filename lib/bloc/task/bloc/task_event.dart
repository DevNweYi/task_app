part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class TaskInitialEvent extends TaskEvent {}

final class TaskAddEvent extends TaskEvent {
  final int titleId;
  final String task;
  TaskAddEvent(this.titleId, this.task);
}

final class TaskEditEvent extends TaskEvent {
  final Task task;
  TaskEditEvent(this.task);
}

final class TaskDeleteEvent extends TaskEvent {
  final Task task;
  TaskDeleteEvent(this.task);
}
