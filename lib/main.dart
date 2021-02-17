import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trafic_ui/profile/first_name.dart';
import 'package:trafic_ui/size_config.dart';
import 'package:trafic_ui/constants.dart';
import 'package:trafic_ui/splash.dart';
import 'package:trafic_ui/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
