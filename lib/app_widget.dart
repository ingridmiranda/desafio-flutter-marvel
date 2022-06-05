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
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.colorLight,
            displayColor: AppColors.colorLight),
        backgroundColor: AppColors.colorDark,
        scaffoldBackgroundColor: AppColors.colorDark,
        appBarTheme: const AppBarTheme(color: AppColors.colorDark),
      ),
      home: const SplashPage(),
    );
  }
}
