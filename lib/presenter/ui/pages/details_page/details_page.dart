import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_flutter_marvel/presenter/ui/theme/app_colors.dart';
import 'package:desafio_flutter_marvel/presenter/view_model/details/details_view_model.dart';
import 'package:desafio_flutter_marvel/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = s1.get<DetailsViewModel>();

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Observer(builder: (_) {
            return Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
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
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 25),
                    child: Text(controller.character?.name ?? "Not identified",
                        style: const TextStyle(
                            fontSize: 24,
                            color: AppColors.colorPrimaryLight,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                      controller.character?.description != null &&
                              controller.character!.description.length > 1
                          ? controller.character!.description
                          : "No more information was founded to this character",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w300)),
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Comics".toUpperCase(),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: AppColors.colorSecondary,
                            fontSize: 12,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
                controller.comicsOptions == ComicsOption.show
                    ? Flexible(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CarouselSlider.builder(
                              itemCount: (controller.comicsList!.length),
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) {
                                return Flex(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 8,
                                      child: Image.network(
                                          '${controller.comicsList?[itemIndex].thumbnail.path}/portrait_xlarge.${controller.comicsList?[itemIndex].thumbnail.extension}'),
                                    ),
                                    Flexible(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            controller.comicsList?[itemIndex]
                                                    .title ??
                                                "",
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ))
                                  ],
                                );
                              },
                              options: CarouselOptions(
                                  autoPlay: true, viewportFraction: 0.4)),
                        ))
                    : controller.comicsOptions == ComicsOption.loading
                        ? const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator(
                              color: AppColors.colorLight,
                            ))
                        : const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                                'Oops, no comic was found to this character'))
              ],
            );
          }),
        ));
  }
}
