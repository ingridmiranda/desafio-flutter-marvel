import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../view_model/characters_view_model.dart';

class ListCharactersWidget extends StatelessWidget {
  const ListCharactersWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CharactersViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount:
              /*  20, */
              controller.characters?.results.length,
          itemBuilder: (BuildContext buildContext, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          '${controller.characters?.results[index].thumbnail.path}/portrait_small.${controller.characters?.results[index].thumbnail.extension}'
                          /* 'http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_xlarge.jpg'*/
                          ),
                    ),
                  ),
                  const Flexible(flex: 1, child: SizedBox(width: 30)),
                  Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.characters?.results[index].name ??
                              "Nome não informado",
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.colorLight,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          controller.characters?.results[index].description !=
                                      null &&
                                  controller.characters!.results[index]
                                          .description.length >
                                      1
                              ? controller
                                  .characters!.results[index].description
                              : "No more information was founded to this character",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.colorLight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
