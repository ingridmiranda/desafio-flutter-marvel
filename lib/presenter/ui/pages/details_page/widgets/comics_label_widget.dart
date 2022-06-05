import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class ComicsLabelWidget extends StatelessWidget {
  const ComicsLabelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text("Comics".toUpperCase(),
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: AppColors.colorSecondary,
                fontSize: 12,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w800)),
      ),
    );
  }
}
