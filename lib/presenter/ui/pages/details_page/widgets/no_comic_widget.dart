import 'package:flutter/material.dart';

class NoComicWidget extends StatelessWidget {
  const NoComicWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text('Oops, no comic was found to this character'));
  }
}
