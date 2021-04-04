import 'package:covid_helper/models/choices_content.dart';
import 'package:flutter/material.dart';

import 'choices_item.dart';

class ChoicesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: ChoicesContent.OPTIONS.map((e) => ChoicesItem(e)).toList(),
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
