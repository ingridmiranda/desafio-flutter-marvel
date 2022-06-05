import 'package:flutter/material.dart';

import './presenter/ui/pages/pages.dart';
import './presenter/ui/theme/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoftDesign Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: AppColors.colorDark,
        appBarTheme: const AppBarTheme(color: AppColors.colorDark),
      ),
      home: const SplashPage(),
    );
  }
}
