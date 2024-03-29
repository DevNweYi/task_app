part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

// final class TaskAddState extends TaskState {}

final class TaskAddSuccessState extends TaskState {}
