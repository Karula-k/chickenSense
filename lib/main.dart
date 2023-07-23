import 'package:chicken_sense/model/result_model.dart';
import 'package:chicken_sense/pages/home_page.dart';
import 'package:chicken_sense/pages/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ResultPage.routeName: (context) => ResultPage(
              result: ModalRoute.of(context)?.settings.arguments as ResultCLass,
            ),
      },
    );
  }
}
