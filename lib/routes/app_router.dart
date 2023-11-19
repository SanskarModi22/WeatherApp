import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: Demo.page, initial: true),
        AutoRoute(page: AuthChecker.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: NavigationBarWidget.page),
      ];
}
