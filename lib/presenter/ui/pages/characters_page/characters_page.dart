import 'package:desafio_flutter_marvel/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../view_model/view_model.dart';
import 'widgets/widgets.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final controller = s1.get<CharactersViewModel>();

  @override
  void initState() {
    controller.scrollController = ScrollController();
    controller.getCharacters(context);
    super.initState();
  }

  @override
  void dispose() {
    controller.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('SoftDesign Challenge'),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              )
            ],
          ),
          body: Flex(
            direction: Axis.vertical,
            children: [
              const HeaderCharactersWidget(),
              CompleteListWidget(
                controller: controller,
                widget: controller.charactersOptions == CharactersOption.show
                    ? ListCharactersWidget(controller: controller)
                    : controller.charactersOptions == CharactersOption.loading
                        ? const LoadingCharacterWidget()
                        : controller.charactersOptions == CharactersOption.empty
                            ? const EmptyCharacterWidget()
                            : const SizedBox(),
              ),
            ],
          ));
    });
  }
}
