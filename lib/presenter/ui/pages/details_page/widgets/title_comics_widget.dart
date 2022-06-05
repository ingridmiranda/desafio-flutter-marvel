import 'package:flutter/material.dart';

import '../../../../view_model/details/details_view_model.dart';
import '../../../theme/app_colors.dart';

class TitleComicsWidget extends StatelessWidget {
  const TitleComicsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailsViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 25),
        child: Text(controller.character?.name ?? "Not identified",
            style: const TextStyle(
                fontSize: 24,
                color: AppColors.colorPrimaryLight,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
