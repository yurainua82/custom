import 'package:custom_project/bloc/app_status/app_status_bloc.dart';
import 'package:custom_project/bloc/appbar/appbar_bloc.dart';
import 'package:custom_project/locator.dart';
import 'package:custom_project/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/components/appbar.dart';

final AppStatusBloc appStatusBloc = new AppStatusBloc();
final AppbarBloc appbarBloc = new AppbarBloc();
Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final AppBarWidget appBar = AppBarWidget();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppStatusBloc>(
          create: (_) => appStatusBloc,
        ),
        BlocProvider<AppbarBloc>(
          create: (_) => appbarBloc,
        )
      ],
      child: MaterialApp(
        title: 'Custom Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (ctx, child) {
          return Container(
            child: BlocBuilder<AppStatusBloc, AppStatusState>(
              bloc: appStatusBloc,
              builder: (ctx, state) {
                return Scaffold(
                  appBar: state.showAppbar ? appBar : null,
                  body: child,
                );
              },
            ),
          );
        },
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: NavigationService.generateRoute,
        initialRoute: prefs.getBool('isSignedIn') == false ? 'login' : 'home',
      ),
    ),
  );
}
