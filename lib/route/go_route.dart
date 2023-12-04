import 'package:flutter/material.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_application_1/seections/home/views/screens/home_screen.dart';
import 'package:flutter_application_1/seections/lamp/views/screens/lamp_screen.dart';
import 'package:flutter_application_1/seections/setting/views/screens/setting_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  //로그인했는지 확인하는 코드. 나중에 수정 추가하기
  //  redirect: (BuildContext context, GoRouterState state) async {
  //   /// 로그인
  //   final String? key = await getIt<FlutterSecureStorage>().read(key: 'accessToken');
  //   if (key == null) {
  //     return checkPermission(state.location);
  //   }
  //   await getIt<AuthCubit>().getUserInfo(key);
  //   return state.location;
  // },
  routes: <RouteBase>[
    GoRoute(
      name: Routes.home.routerName,
      path: Routes.home.routerName,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return transitionPage<void>(context: context, state: state, child: const HomeScreen());
      },
      routes: <RouteBase>[
        GoRoute(
          name: Routes.setting.routerName,
          path: Routes.setting.routerName, //경로
          pageBuilder: (BuildContext context, GoRouterState state) {
            return transitionPage<void>(context: context, state: state, child: const SettingScreen());
          },
        ),
        GoRoute(
          name: Routes.lamp.routerName,
          path: Routes.lamp.routerName, //경로
          pageBuilder: (BuildContext context, GoRouterState state) {
            return transitionPage<void>(context: context, state: state, child: const LampScreen());
          },
        ),
      ],
    ),
  ],
);

CustomTransitionPage<void> transitionPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder:
        (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
            FadeTransition(opacity: animation, child: child),
  );
}

Future<void> goPushPage(
  BuildContext context,
  Routes route, {
  Object? param,
}) async {
  context.push('\\${route.routerName}', extra: param);
}

Future<void> goPage(BuildContext context, Routes route, {Object? param}) async {
  context.pushReplacement('\\${route.routerName}', extra: param);
}

String checkPermission(String location) {
  // if (location.startsWith(Routes.GENERATED.routerName) ||
  //     location.startsWith(Routes.GENERATEDAIMODEL.routerName) ||
  //     location.startsWith('admin') ||
  //     location.startsWith(Routes.MYPAGE.routerName) ||
  //     location.startsWith(Routes.NOTI.routerName) ||
  //     location.startsWith(Routes.GALLERY.routerName) ||
  //     location.startsWith(Routes.GALLERY.routerName)) {
  //   return '/${Routes.SIGNIN.routerName}';
  // } else
  return location;
}

Future<void> goPageWithQueryParam(
  BuildContext context,
  Routes route, {
  Object? param,
}) async {
  context.goNamed(
    route.routerName,
    extra: param,
    queryParameters: <String, dynamic>{
      'design_id': param.toString(),
    },
  );
}
