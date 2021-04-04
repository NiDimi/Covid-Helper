import 'package:covid_helper/models/choices_content.dart';
import 'package:covid_helper/providers/sms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoicesItem extends StatelessWidget {
  final ChoicesContent _choice;// The choice that is being set up

  ChoicesItem(this._choice);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<SMS>(context, listen: false).sendMessage(_choice.number);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Text(
            (_choice.number),
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Divider(color: Colors.black),
          Text(
            _choice.description,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ]),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _choice.color.withOpacity(0.7),
                _choice.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
