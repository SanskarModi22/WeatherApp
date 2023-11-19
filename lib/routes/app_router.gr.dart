// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:weather_app/pages/auth_check.dart' as _i1;
import 'package:weather_app/pages/demo.dart' as _i2;
import 'package:weather_app/pages/login_page.dart' as _i3;
import 'package:weather_app/pages/weather_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthChecker.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthChecker(),
      );
    },
    Demo.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Demo(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    WeatherRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WeatherPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthChecker]
class AuthChecker extends _i5.PageRouteInfo<void> {
  const AuthChecker({List<_i5.PageRouteInfo>? children})
      : super(
          AuthChecker.name,
          initialChildren: children,
        );

  static const String name = 'AuthChecker';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Demo]
class Demo extends _i5.PageRouteInfo<void> {
  const Demo({List<_i5.PageRouteInfo>? children})
      : super(
          Demo.name,
          initialChildren: children,
        );

  static const String name = 'Demo';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WeatherPage]
class WeatherRoute extends _i5.PageRouteInfo<void> {
  const WeatherRoute({List<_i5.PageRouteInfo>? children})
      : super(
          WeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
