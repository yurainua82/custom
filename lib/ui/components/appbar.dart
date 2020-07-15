import 'package:custom_project/bloc/app_status/app_status_bloc.dart';
import 'package:custom_project/bloc/appbar/appbar_bloc.dart';
import 'package:custom_project/main.dart';
import 'package:custom_project/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}
class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BlocBuilder<AppbarBloc, AppbarState>(
        builder: (context, state) {
          return state.showBackButton
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    NavigationService().pop();
                  },
                )
              : IconButton(icon: Icon(Icons.home),
                  onPressed: () {
                    AppStatusState state =
                        BlocProvider.of<AppStatusBloc>(context).state;
                    BlocProvider.of<AppStatusBloc>(context).add(
                      UpdateAppStatus(
                        showAppbar: state.showAppbar,
                      
                      ),
                    );
                  },
                );
        },
      ),
      title: BlocBuilder<AppbarBloc, AppbarState>(
        bloc: appbarBloc,
        builder: (context, state) => Text(state.title),
      ),
      centerTitle: true,
    );
  }
}
