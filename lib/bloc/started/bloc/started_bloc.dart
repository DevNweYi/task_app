import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'started_event.dart';
part 'started_state.dart';

class StartedBloc extends Bloc<StartedEvent, StartedState> {
  StartedBloc() : super(StartedInitial()) {
    on<StartedEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetStartedPressed>((event, emit) {
      debugPrint("Pressed Get Started Button");
    });
  }
}
