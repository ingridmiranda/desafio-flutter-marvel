import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../view_model/view_model.dart';
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

                    return ItemListCharacters(
                        controller: controller, index: index);
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
