import 'package:flutter/material.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'data/data.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Data()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social Ui',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: LoginScreen(),
    );
  }
}

