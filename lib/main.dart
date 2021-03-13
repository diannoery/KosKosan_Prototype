import 'package:flutter/material.dart';
import 'package:kos_kosan_app/pages/splash.dart';
import 'package:kos_kosan_app/provider/space_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SpaceProvider(),
      child:  MaterialApp(
      home: SplashPage(),
    ),
    );
  }
}
