part of 'app_status_bloc.dart';

abstract class AppStatusState extends Equatable {
  final bool showAppbar;

  AppStatusState({this.showAppbar = false});

  @override
  List<Object> get props => [showAppbar];
}

class AuthInitial extends AppStatusState {}

class UpdateStatus extends AppStatusState {
  final bool showAppbar;

  UpdateStatus({this.showAppbar}) : super(showAppbar: showAppbar);
}
