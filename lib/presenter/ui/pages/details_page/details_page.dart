import 'package:desafio_flutter_marvel/presenter/ui/theme/app_colors.dart';
import 'package:desafio_flutter_marvel/presenter/view_model/details/details_view_model.dart';
import 'package:desafio_flutter_marvel/utils/dependency_injection.dart';
import 'package:flutter/material.dart';

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
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                flex: 1,
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
                          '${controller.character?.thumbnail.path}/standard_amazing.${controller.character?.thumbnail.extension}'),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
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
              )
            ],
          ),
        ));
  }
}
