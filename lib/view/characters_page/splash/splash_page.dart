import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/app_colors.dart';
import '../characters_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'lib/assets/images/marvel_logo.png',
      nextScreen: const CharactersPage(),
      backgroundColor: AppColors.colorDark,
      splashIconSize: 50,
      duration: 1500,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
