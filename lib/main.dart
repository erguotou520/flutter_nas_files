import 'package:flutter/material.dart';
import 'package:nas_files/pages/home.dart';
import 'package:nas_files/pages/connect.dart';
import 'package:nas_files/utils/config.dart';

void main() async {
  await initConfigData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _hasConfigs = hasConfigs();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nas Files',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: _hasConfigs ? '/files' : '/',
      routes: {'/': (context) => HomePage(), '/connect': (context) => ConnectPage()},
    );
  }
}
