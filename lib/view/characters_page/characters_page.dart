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
    //controller.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
          backgroundColor: AppColors.colorDark,
          body: /*  controller.charactersOptions == CharactersOption.show
            ? */
              Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                  child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 25, bottom: 8),
                child: const Text(
                  'Personagens',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.colorPrimary,
                      fontWeight: FontWeight.bold),
                ),
              )),
              Flexible(
                flex: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.colorGray,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: ListView.builder(
                        itemCount: 20, //controller.characters?.results.length,
                        itemBuilder: (BuildContext buildContext, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Flex(
                              direction: Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Flexible(
                                  flex: 3,
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                        'http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_xlarge.jpg' /* '${controller.characters?.results[index].thumbnail.path}/portrait_small.${controller.characters?.results[index].thumbnail.extension}' */),
                                  ),
                                ),
                                const Flexible(
                                    flex: 1, child: SizedBox(width: 30)),
                                Flexible(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        /* controller.characters?.results[index].name ??*/
                                        "Nome não informado",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.colorLight,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        /* controller.characters?.results[index].name ??*/
                                        "Descrição bal bal ajioh hoih hoih oih ioh ioh hoih ",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
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
                ),
              ),
            ],
          )
          //: controller.charactersOptions == CharactersOption.loading
          // ? const CircularProgressIndicator()
          //  : const SizedBox(),
          );
    });
  }
}
