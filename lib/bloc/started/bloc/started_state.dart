part of 'started_bloc.dart';

@immutable
sealed class StartedState {}

final class StartedInitial extends StartedState {}

final class GetStartedState extends StartedState {}
