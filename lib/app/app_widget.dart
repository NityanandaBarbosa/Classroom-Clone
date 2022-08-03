import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/core/errors/token_expired_or_invalid.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    TripleObserver.addListener((triple) {
      if (triple.error is TokenExpiredOrInvalid) {
        const snackBar = SnackBar(
          content: Text("Session expired, redirecting to login!"),
          backgroundColor: Colors.red,
        );
        snackbarKey.currentState?.showSnackBar(snackBar);
      }
    });
    return MaterialApp.router(
      title: 'Flutter Slidy',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(primarySwatch: Colors.green),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
