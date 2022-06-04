import 'package:desafio_flutter_marvel/model/repositories/get_data_repository.dart';
import 'package:desafio_flutter_marvel/model/services/get_data_dio_services.dart';
import 'package:desafio_flutter_marvel/utils/app_colors.dart';
import 'package:desafio_flutter_marvel/view_model/characters_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    controller.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.colorDark,
            title: const Text('SoftDesign Challenge'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
          backgroundColor: AppColors.colorDark,
          body: Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                  flex: 3,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        flex: 8,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.8,
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'lib/assets/images/marvel_background.jpg',
                                  ))),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 25, bottom: 8),
                          child: const Text(
                            'Personagens',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.colorPrimaryLight,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )),
              Flexible(
                flex: 7,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorGray.withOpacity(0.9),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: controller.charactersOptions ==
                              CharactersOption.show
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ListView.builder(
                                  itemCount:
                                      /*  20, */
                                      controller.characters?.results.length,
                                  itemBuilder:
                                      (BuildContext buildContext, int index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          const Flexible(
                                              flex: 1,
                                              child: SizedBox(width: 30)),
                                          Flexible(
                                            flex: 6,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                          .characters
                                                          ?.results[index]
                                                          .name ??
                                                      "Nome não informado",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          AppColors.colorLight,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  controller
                                                                  .characters
                                                                  ?.results[
                                                                      index]
                                                                  .description !=
                                                              null &&
                                                          controller
                                                                  .characters!
                                                                  .results[
                                                                      index]
                                                                  .description
                                                                  .length >
                                                              1
                                                      ? controller
                                                          .characters!
                                                          .results[index]
                                                          .description
                                                      : "No more information was founded to this character",
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                          AppColors.colorLight),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          : controller.charactersOptions ==
                                  CharactersOption.loading
                              ? const CircularProgressIndicator()
                              : const SizedBox(),
                    )),
              ),
            ],
          ));
    });
  }
}
