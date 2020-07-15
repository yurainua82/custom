part of 'appbar_bloc.dart';

abstract class AppbarState extends Equatable {
  final String title;
  final bool showBackButton;
  const AppbarState({this.title, this.showBackButton = false});
  @override
  List<Object> get props => [title, showBackButton];
}

class AppbarInitial extends AppbarState {
  final String title;
  final bool showBackButton;
  AppbarInitial({this.title = '', this.showBackButton = false})
      : super(title: title, showBackButton: showBackButton);
}

class AppbarUpdateState extends AppbarState {
  final String title;
  final bool showBackButton;
  AppbarUpdateState({this.title: '', this.showBackButton = false})
      : super(title: title, showBackButton: showBackButton);
}
