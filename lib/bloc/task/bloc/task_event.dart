part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class TaskAddEvent extends TaskEvent {
  final int titleId;
  final String task;
  TaskAddEvent(this.titleId, this.task);
}
