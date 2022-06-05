import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_flutter_marvel/presenter/ui/shared/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../view_model/details/details_view_model.dart';

class ComicsCarouselWidget extends StatelessWidget {
  const ComicsCarouselWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailsViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CarouselSlider.builder(
              itemCount: (controller.comicsList!.length),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 8,
                      child: NetworkImageWidget(
                          imageUrl:
                              '${controller.comicsList?[itemIndex].thumbnail.path}/portrait_xlarge.${controller.comicsList?[itemIndex].thumbnail.extension}'),
                    ),
                    Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            controller.comicsList?[itemIndex].title ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ))
                  ],
                );
              },
              options: CarouselOptions(autoPlay: true, viewportFraction: 0.4)),
        ));
  }
}
