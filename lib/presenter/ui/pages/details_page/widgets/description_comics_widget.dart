import 'package:desafio_flutter_marvel/presenter/view_model/details/details_view_model.dart';
import 'package:flutter/material.dart';

class DescriptionComicsWidget extends StatelessWidget {
  const DescriptionComicsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailsViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Text(
          controller.character?.description != null &&
                  controller.character!.description.length > 1
              ? controller.character!.description
              : "No more information was founded to this character",
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
    );
  }
}
