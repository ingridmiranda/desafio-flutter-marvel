import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class LoadingComicsWidget extends StatelessWidget {
  const LoadingComicsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 20),
        child: CircularProgressIndicator(
          color: AppColors.colorLight,
        ));
  }
}
