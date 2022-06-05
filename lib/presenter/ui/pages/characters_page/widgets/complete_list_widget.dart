import 'package:flutter/material.dart';

import '../../../../view_model/view_model.dart';
import '../../../theme/app_colors.dart';

class CompleteListWidget extends StatelessWidget {
  const CompleteListWidget(
      {Key? key, required this.controller, required this.widget})
      : super(key: key);

  final CharactersViewModel controller;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 7,
      fit: FlexFit.tight,
      child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.colorGray.withOpacity(0.9),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: widget)),
    );
  }
}
