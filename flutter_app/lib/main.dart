import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice3/router/routes.dart';

//import 'bottom_bar.dart';

void main() {
  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'タスク管理アプリ', // titleを追加
      theme: ThemeData(
        // themeを追加
        primarySwatch: Colors.lightBlue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 59, 236, 252),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.grey,
            ),
      ),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      //home: const BottomBar(),
    );
  }
}
