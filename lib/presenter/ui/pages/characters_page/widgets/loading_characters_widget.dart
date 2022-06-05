import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class LoadingCharacterWidget extends StatelessWidget {
  const LoadingCharacterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Transform.scale(
      scale: 0.1,
      child: const CircularProgressIndicator(
        strokeWidth: 15,
        color: AppColors.colorLight,
      ),
    ));
  }
}
