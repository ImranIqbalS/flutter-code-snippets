import 'package:flutter/material.dart';
// import 'package:flutter_code_snippets/stack_position_border_boxshadow/stack.dart';
// import 'custom_clipper_curve/clipper_curve.dart';
import 'package:flutter_code_snippets/getx_navigation_state_management/getx_navigation.dart';
import 'package:flutter_code_snippets/url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UrlLauncher(),
    );
  }
}
