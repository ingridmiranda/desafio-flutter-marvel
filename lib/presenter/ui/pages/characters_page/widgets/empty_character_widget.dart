import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class EmptyCharacterWidget extends StatelessWidget {
  const EmptyCharacterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Center(
          child: Text(
        'Oops, no characters were found yet...\nTry again later!',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.colorLight),
      )),
    );
  }
}
