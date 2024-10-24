import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice3/pages/add_page.dart';
import 'package:practice3/pages/edit_page.dart';
import 'package:practice3/pages/home_page.dart';
import 'package:practice3/pages/profile_button.dart';

import 'branch/app_navigation_bar.dart';

// part '../router/branch/add_todo_branch.dart';
// part '../router/branch/home_branch.dart';
// part '../router/branch/profile_branch.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final todoNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'todo');
final profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    routes: appRoutes,
    // routes: appRoutes,
  ),
);

final appRoutes = [
  StatefulShellRoute.indexedStack(
    parentNavigatorKey: rootNavigatorKey,
    builder: (context, state, navigationShell) {
      return AppNavigationBar(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(navigatorKey: homeNavigatorKey, routes: [
        GoRoute(
            name: 'home',
            path: '/home',
            pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const HomePage(),
                ),
            routes: [
              GoRoute(
                name: 'AddTodo',
                path: 'AddTodo',
                parentNavigatorKey: rootNavigatorKey,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: AddTodoButton(),
                ),
              ),
              GoRoute(
                name: 'EditTodo',
                path: 'EditTodo',
                parentNavigatorKey: rootNavigatorKey,
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  final id = extra?['id'] ?? 0;
                  final title = extra?['title'] ?? 'Default Title';
                  final detail = extra?['detail'] ?? 'Default Detail';
                  return MaterialPage(
                    key: state.pageKey,
                    child: EditTodo(id: id, title: title, detail: detail),
                  );
                },
              )
            ]),
      ]),
      StatefulShellBranch(navigatorKey: todoNavigatorKey, routes: [
        GoRoute(
          name: 'addTodo',
          path: '/addTodo',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const AddTodoButton(),
          ),
        ),
      ]),
      StatefulShellBranch(
        navigatorKey: profileNavigatorKey,
        routes: [
          GoRoute(
            name: 'profile',
            path: '/profile',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileButton(),
            ),
          ),
        ],
      ),
    ],
  ),
];

// final _rootNavigatorKey = GlobalKey<NavigatorState>();

// final routerProvider = Provider((ref) =>
//    GoRouter(
//     initialLocation: '/home',
//     navigatorKey: _rootNavigatorKey,
//     routes: $appRoutes, // 生成されたルート
//     errorPageBuilder: (context, state) => MaterialPage(
//       child: errorscreen),)
//   );
// );

// class MainShellRouteData extends StatefulShellRouteData {
//   const MainShellRouteData();

//   @override
//   Widget builder(
//     BuildContext context,
//     GoRouterState state,
//     StatefulNavigationShell navigationShell,
//   ) {
//     return AppNavigationBar(navigationShell: navigationShell);
//   }
// }

// class AppNavigationBar extends StatelessWidget {
//   const AppNavigationBar({
//     super.key,
//     required this.navigationShell,
//   });

//   final StatefulNavigationShell navigationShell;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: NavigationBar(
//         selectedIndex: navigationShell.currentIndex,
//         destinations: const [
//           NavigationDestination(
//             icon: Icon(Icons.home),
//             label: 'ホーム',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.settings),
//             label: 'TODO追加',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.people),
//             label: 'プロフィール',
//           ),
//         ],
//         onDestinationSelected: _goBranch,
//       ),
//     );
//   }

//   void _goBranch(int index) {
//     navigationShell.goBranch(
//       index,
//       initialLocation: index == navigationShell.currentIndex,
//     );
//   }
// }

// final goRouter = GoRouter(initialLocation: '/', routes: [
//   GoRoute(
//     name: 'HomePage',
//     path: '/',
//     pageBuilder: (context, state) => MaterialPage(
//       key: state.pageKey,
//       child: HomePage(),
//     ),
//   ),
//   GoRoute(
//     name: 'AddTodo',
//     path: '/AddTodo',
//     pageBuilder: (context, state) => MaterialPage(
//       key: state.pageKey,
//       child: AddTodoButton(),
//     ),
//   ),
//   GoRoute(
//       name: 'EditTodo',
//       path: '/EditTodo',
//       pageBuilder: (context, state) {
//         final extra = state.extra as Map<String, dynamic>?;
//         final id = extra?['id'] ?? 0;
//         final title = extra?['title'] ?? 'Default Title';
//         final detail = extra?['detail'] ?? 'Default Detail';
//         return MaterialPage(
//           key: state.pageKey,
//           child: EditTodo(id: id, title: title, detail: detail),
//         );
//       }),
// ]);
