part of 'appbar_bloc.dart';

abstract class AppbarEvent extends Equatable {
  final String title;
  final bool showBackButton;
  const AppbarEvent({this.title, this.showBackButton = false});
  @override
  List<Object> get props => [title, showBackButton];
}

class AppbarUpdateEvent extends AppbarEvent {
  final String title;
  final bool showBackButton;
  AppbarUpdateEvent({this.title = '', this.showBackButton = false})
      : super(title: title, showBackButton: showBackButton);
}
