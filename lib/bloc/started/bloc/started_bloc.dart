import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/database/app_database.dart';
import 'package:task_app/database/title/title_table.dart';

part 'started_event.dart';
part 'started_state.dart';

class StartedBloc extends Bloc<StartedEvent, StartedState> {
  StartedBloc() : super(StartedInitial()) {
    on<StartedEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetStartedPressed>((event, emit) {
      debugPrint("Pressed Get Started Button");
      //added title
      GetIt.instance
          .get<AppDatabase>()
          .titleDao
          .addTitle(Title(titleName: "Today", imageName: "sun.png"));
      GetIt.instance
          .get<AppDatabase>()
          .titleDao
          .addTitle(Title(titleName: "Planned", imageName: "calendar.png"));
      GetIt.instance
          .get<AppDatabase>()
          .titleDao
          .addTitle(Title(titleName: "Personal", imageName: "writer.png"));
      GetIt.instance
          .get<AppDatabase>()
          .titleDao
          .addTitle(Title(titleName: "Work", imageName: "suitcase.png"));
      GetIt.instance
          .get<AppDatabase>()
          .titleDao
          .addTitle(Title(titleName: "Shopping", imageName: "shop.png"));
    });
  }
}
