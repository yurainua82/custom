import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appbar_event.dart';
part 'appbar_state.dart';

class AppbarBloc extends Bloc<AppbarEvent, AppbarState> {
  AppbarBloc() : super(AppbarInitial());

  @override
  Stream<AppbarState> mapEventToState(
    AppbarEvent event,
  ) async* {
    if (event is AppbarUpdateEvent) {
      yield new AppbarUpdateState(
          title: event.title, showBackButton: event.showBackButton);
    }
  }

  @override
  void onTransition(Transition<AppbarEvent, AppbarState> transition) {
    super.onTransition(transition);
  }
}
