import 'package:flutter/material.dart';
import 'package:make_sleep_better/src/providers/main.dart';
import 'package:make_sleep_better/src/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => MainProvider(),
      )
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<MainProvider, bool>(
      selector: (context, notifier) => notifier.darkMode,
      builder: (context, data, child) {
        print('rebuild material app');

        return MaterialApp(
          title: 'Flutter Dem',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: data ? Brightness.dark : Brightness.light),
          home: child,
        );
      },
      child: HomePage(),
    );
  }
}
