part of 'started_bloc.dart';

@immutable
sealed class StartedEvent {}

final class GetStartedPressed extends StartedEvent {}
