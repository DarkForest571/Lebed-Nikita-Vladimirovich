import 'package:auto_route/auto_route.dart';
import './homep.dart';
import './rootp.dart';
import './photop.dart';
part 'app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RootRoute.page,
      initial: true,
      children: [
        AutoRoute(page: MyHomeRoute.page, initial: true),
        AutoRoute(page: PhotoRoute.page),
      ],
    ),
  ];
}