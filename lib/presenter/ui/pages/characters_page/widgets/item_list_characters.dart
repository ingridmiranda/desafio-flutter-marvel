import 'package:desafio_flutter_marvel/presenter/view_model/details/details_view_model.dart';
import 'package:desafio_flutter_marvel/utils/dependency_injection.dart';
import 'package:flutter/material.dart';

import '../../../../view_model/view_model.dart';
import '../../../theme/app_colors.dart';
import '../../pages.dart';

class ItemListCharacters extends StatelessWidget {
  const ItemListCharacters(
      {Key? key, required this.controller, required this.index})
      : super(key: key);

  final CharactersViewModel controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final detailsController = s1.get<DetailsViewModel>();
        detailsController.openDetailsInfo(controller.charactersList?[index],
            controller.characters?.results[index].id ?? 0, context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailsPage()));
      },
      child: Container(
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
                    '${controller.charactersList?[index].thumbnail.path}/standard_medium.${controller.charactersList?[index].thumbnail.extension}'),
              ),
            ),
            const Flexible(flex: 1, child: SizedBox(width: 30)),
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.charactersList?[index].name ?? "Not identified",
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.colorLight,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.charactersList != null &&
                            controller
                                    .charactersList![index].description.length >
                                1
                        ? controller.charactersList![index].description
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
      ),
    );
  }
}
