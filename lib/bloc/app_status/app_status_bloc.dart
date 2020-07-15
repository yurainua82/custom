import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_status_event.dart';
part 'app_status_state.dart';

class AppStatusBloc extends Bloc<AppStatusEvent, AppStatusState> {
  AppStatusBloc() : super(AuthInitial());

  @override
  Stream<AppStatusState> mapEventToState(
    AppStatusEvent event,
  ) async* {
    if (event is UpdateAppStatus) {
      yield UpdateStatus(
        showAppbar: event.showAppbar,
      );
    } else {
      yield new AuthInitial();
    }
  }

  @override
  void onTransition(Transition<AppStatusEvent, AppStatusState> transition) {
    super.onTransition(transition);
  }
}
