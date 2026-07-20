import 'package:flutter/material.dart';
import 'package:umicat_app/src/init/page/init_start_page.dart';
import 'package:umicat_app/src/splash/page/splash.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isInitStarted = true;

  @override
  Widget build(BuildContext context) {
    return isInitStarted
        ? InitStartPage(
            onStart: () {
              setState(() {
                isInitStarted = false;
              });
            },
          )
        : const SplashPage();
  }
}
