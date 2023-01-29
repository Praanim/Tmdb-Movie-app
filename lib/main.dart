import 'package:api_with_riverpod/controller/services_controller.dart';
import 'package:api_with_riverpod/core/error_text.dart';
import 'package:api_with_riverpod/core/failure.dart';
import 'package:api_with_riverpod/core/loader.dart';
import 'package:api_with_riverpod/router.dart';
import 'package:api_with_riverpod/ui/components/big_mov_card.dart';
import 'package:api_with_riverpod/ui/components/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Common.backGroundColor,
            cardColor: Common.backGroundColor,
            appBarTheme: AppBarTheme(
              backgroundColor: Common.backGroundColor,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            backgroundColor: Common.backGroundColor,
            primaryColorLight: Common.backGroundColor,
            primaryColor: Color.fromARGB(255, 153, 117, 219)),
        routeInformationParser: RoutemasterParser(),
        routerDelegate: RoutemasterDelegate(
          routesBuilder: (context) {
            return loggedInRoute;
          },
        ));
  }
}
