// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:cross_platform_assignment/presentation/add_story_screen.dart'
    as _i1;
import 'package:cross_platform_assignment/presentation/home_screen.dart' as _i2;
import 'package:cross_platform_assignment/presentation/login_screen.dart'
    as _i3;
import 'package:cross_platform_assignment/presentation/read_story_screen.dart'
    as _i4;
import 'package:cross_platform_assignment/presentation/registration_screen.dart'
    as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart' as _i8;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AddStoryRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddStoryScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    ReadStoryRoute.name: (routeData) {
      final args = routeData.argsAs<ReadStoryRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ReadStoryScreen(
          key: args.key,
          story: args.story,
        ),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegistrationScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddStoryScreen]
class AddStoryRoute extends _i6.PageRouteInfo<void> {
  const AddStoryRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AddStoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStoryRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ReadStoryScreen]
class ReadStoryRoute extends _i6.PageRouteInfo<ReadStoryRouteArgs> {
  ReadStoryRoute({
    _i7.Key? key,
    required _i8.ParseObject story,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ReadStoryRoute.name,
          args: ReadStoryRouteArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'ReadStoryRoute';

  static const _i6.PageInfo<ReadStoryRouteArgs> page =
      _i6.PageInfo<ReadStoryRouteArgs>(name);
}

class ReadStoryRouteArgs {
  const ReadStoryRouteArgs({
    this.key,
    required this.story,
  });

  final _i7.Key? key;

  final _i8.ParseObject story;

  @override
  String toString() {
    return 'ReadStoryRouteArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i5.RegistrationScreen]
class RegistrationRoute extends _i6.PageRouteInfo<void> {
  const RegistrationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
