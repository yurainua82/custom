part of 'app_status_bloc.dart';

abstract class AppStatusEvent extends Equatable {
  final bool showAppbar;

  AppStatusEvent({this.showAppbar = false});

  @override
  List<Object> get props => [showAppbar];
}

class UpdateAppStatus extends AppStatusEvent {
  final bool showAppbar;

  UpdateAppStatus({this.showAppbar}) : super(showAppbar: showAppbar);
}

class ResetAppStatus extends AppStatusEvent {
  ResetAppStatus() : super();
}
