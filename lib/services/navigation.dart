import 'package:custom_project/bloc/app_status/app_status_bloc.dart';
import 'package:custom_project/bloc/appbar/appbar_bloc.dart';
import 'package:custom_project/locator.dart';
import 'package:custom_project/ui/home/home.dart';
import 'package:custom_project/ui/photo/photo.dart';
import 'package:custom_project/ui/screens/login/login.dart';
import 'package:custom_project/ui/screens/news/components/new.dart';
import 'package:custom_project/ui/screens/news/news.dart';
import 'package:custom_project/ui/screens/qr/qr.dart';
import 'package:flutter/material.dart';
import 'package:custom_project/ui/screens/profile/profile.dart';
import '../main.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return locator<NavigationService>()
        .navigatorKey
        .currentState
        .pushNamed(routeName);
  }

  Future<dynamic> clearStackAndNavigate(String routeName) {
    locator<NavigationService>()
        .navigatorKey
        .currentState
        .popUntil((route) => route.isFirst);
    return locator<NavigationService>()
        .navigatorKey
        .currentState
        .pushReplacementNamed(routeName);
  }

  Future<bool> pop() async {
    NavigatorState state =
        locator<NavigationService>().navigatorKey.currentState;
    bool res = state.canPop();
    if (res) {
      state.pop();
      state.popUntil(
        (route) {
          _updateAppStateBasedOnRouteName(route.settings);
          return true;
        },
      );
    }
    return Future.value(res);
  }

  Future<dynamic> navigate(String routeName) {
    switch (routeName) {
      case 'login':
        {
          return clearStackAndNavigate(routeName);
        }
      case 'home':{
        return clearStackAndNavigate(routeName);
      }
      default:
        {
          return navigateTo(routeName);
        }
    }
  }

  static willPop(Widget screen, RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => WillPopScope(
        child: screen,
        onWillPop: () {
          locator<NavigationService>().pop();

          return Future.value(false);
        },
      ),
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    _updateAppStateBasedOnRouteName(settings);

    switch (settings.name) {
      case 'login':
        {
          return willPop(LoginScreen(), settings);
        }
      case 'profile':
      {
        return willPop(ProfileScreen(),settings);
      }
      case 'home':
      {
        return willPop(HomeScreen(),settings);
      }
      case 'news':
      {
        return willPop(NewsScreen(),settings);
      }
      case 'new':
      {
        return willPop(NewScreen(settings.arguments),settings);
      }
      case 'qr':
      {
        return willPop(GenerateScreen(),settings);
      }
      case 'photo':
      {
        return willPop(PhotoScreen(),settings);
      }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Future<void> _updateAppStateBasedOnRouteName(
      RouteSettings settings) async {
    switch (settings.name) {
      case 'login':
        {
          appStatusBloc.add(UpdateAppStatus(
              showAppbar: false));
          appbarBloc.add(AppbarUpdateEvent());

          break;
        }
      case 'profile':
        {
          appStatusBloc.add(UpdateAppStatus(
              showAppbar: true));
          appbarBloc.add(AppbarUpdateEvent(title: 'Profile',showBackButton: true));

          break;
        }
      case 'news':
        {
          appStatusBloc.add(UpdateAppStatus(
              showAppbar: true));
          appbarBloc.add(AppbarUpdateEvent(title: 'News',showBackButton: true));

          break;
        }
      case 'qr':
        {
          appStatusBloc.add(UpdateAppStatus(
              showAppbar: true));
          appbarBloc.add(AppbarUpdateEvent(title: 'QR',showBackButton: true));

          break;
        }
      case 'photo':
        {
          appStatusBloc.add(UpdateAppStatus(
              showAppbar: true));
          appbarBloc.add(AppbarUpdateEvent(title: 'Photo',showBackButton: true));

          break;
        }
      case 'home':
        {
          appStatusBloc.add(UpdateAppStatus(
              showAppbar: false));
          appbarBloc.add(AppbarUpdateEvent());

          break;
        }
    }
  }
}
