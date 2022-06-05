import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class LazyLoadingCharactersWidget extends StatelessWidget {
  const LazyLoadingCharactersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(color: AppColors.colorLight)),
    );
  }
}
