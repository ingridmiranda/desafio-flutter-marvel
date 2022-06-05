import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../utils/dependency_injection.dart';
import '../../../view_model/details/details_view_model.dart';
import './widgets/title_comics_widget.dart';
import './widgets/widgets.dart';

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
                HeaderComicsWidget(controller: controller),
                TitleComicsWidget(controller: controller),
                DescriptionComicsWidget(controller: controller),
                const ComicsLabelWidget(),
                controller.comicsOptions == ComicsOption.show
                    ? ComicsCarouselWidget(controller: controller)
                    : controller.comicsOptions == ComicsOption.loading
                        ? const LoadingComicsWidget()
                        : const NoComicWidget()
              ],
            );
          }),
        ));
  }
}
