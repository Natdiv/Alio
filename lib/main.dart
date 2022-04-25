import 'package:alio/ui/pages/integration/onboarding.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(AlioApp());
}

class AlioApp extends StatelessWidget {
  const AlioApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Alio',
        debugShowCheckedModeBanner: false,
        theme: AlioTheme.light(),
        home: const OnBoardingScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(),
    );
  }
}
