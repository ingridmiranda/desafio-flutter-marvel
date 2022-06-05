import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class HeaderCharactersWidget extends StatelessWidget {
  const HeaderCharactersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 3,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              flex: 8,
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.8,
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'lib/presenter/ui/assets/images/marvel_background.jpg',
                        ))),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 25, bottom: 8),
                child: const Text(
                  'Characters',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.colorPrimaryLight,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
