import 'package:auto_route/auto_route.dart';
import 'package:suitmedia_01/core/routes/router.gr.dart';

/// Class widget last name should be [Page] or [Screen] to be recognized.
/// With annotation '@RoutePage()' in the new page.
/// Build new router with 'dart run build_runner build'
/// Then create the CustomRoute with the page name and path below.
@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes =>
      [
        CustomRoute(
          page: FirstRoute.page,
          path: '/first-page',
          transitionsBuilder: TransitionsBuilders.fadeIn,
          initial: true,
        ),
        CustomRoute(
          page: SecondRoute.page,
          path: '/second-page',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: ThirdRoute.page,
          path: '/third-page',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
