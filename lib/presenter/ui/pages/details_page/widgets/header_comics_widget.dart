import 'package:flutter/material.dart';

import '../../../../view_model/details/details_view_model.dart';

class HeaderComicsWidget extends StatelessWidget {
  const HeaderComicsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailsViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.2,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'lib/presenter/ui/assets/images/marvel_background.jpg',
                    ))),
          ),
          CircleAvatar(
            radius: 65,
            backgroundImage: NetworkImage(
                '${controller.character?.thumbnail.path}/landscape_amazing.${controller.character?.thumbnail.extension}'),
          )
        ],
      ),
    );
  }
}
