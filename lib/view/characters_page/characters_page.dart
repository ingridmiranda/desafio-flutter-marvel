import 'package:desafio_flutter_marvel/model/repositories/get_data_repository.dart';
import 'package:desafio_flutter_marvel/model/services/get_data_dio_services.dart';
import 'package:desafio_flutter_marvel/utils/app_colors.dart';
import 'package:desafio_flutter_marvel/view_model/characters_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widgets/widgets.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final controller =
      CharactersViewModel(repository: GetDataRepository(GetDataDioServices()));

  @override
  void initState() {
    controller.getCharacters(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.colorDark,
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
          backgroundColor: AppColors.colorDark,
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
                        : const EmptyCharacterWidget(),
              ),
            ],
          ));
    });
  }
}
