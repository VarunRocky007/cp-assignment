import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_assignment/navigation/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/home",
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: "/login",
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: "/registration",
          page: RegistrationRoute.page,
        ),
        AutoRoute(
          path: "/add",
          page: AddStoryRoute.page,
        ),
        AutoRoute(
          path: "/read",
          page: ReadStoryRoute.page,
        )
      ];
}
