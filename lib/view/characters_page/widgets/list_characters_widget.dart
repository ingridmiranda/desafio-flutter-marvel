import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../utils/app_colors.dart';
import '../../../view_model/characters_view_model.dart';
import './widgets.dart';

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
      child: Observer(builder: (_) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  itemCount: controller.charactersList?.length,
                  itemBuilder: (BuildContext buildContext, int index) {
                    controller.scrollController.addListener(
                        () => controller.infiniteScrolling(context));

                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 3,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  '${controller.charactersList?[index].thumbnail.path}/portrait_small.${controller.charactersList?[index].thumbnail.extension}'
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
                                  controller.charactersList?[index].name ??
                                      "Not identified",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.colorLight,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  controller.charactersList != null &&
                                          controller.charactersList![index]
                                                  .description.length >
                                              1
                                      ? controller
                                          .charactersList![index].description
                                      : "No more information was founded to this character",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.colorLight),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            controller.loadingCharacters
                ? const LazyLoadingCharactersWidget()
                : const SizedBox()
          ],
        );
      }),
    );
  }
}
