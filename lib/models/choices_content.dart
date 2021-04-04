import 'package:flutter/material.dart';

class ChoicesContent {
  final String number;
  final String description;
  final Color color;

  ChoicesContent({
    @required this.number,
    @required this.description,
    @required this.color,
  });

  //All the options that exist
  static List<ChoicesContent> OPTIONS = [
    ChoicesContent(
      number: '1',
      description: 'Visit to a pharmacy or visit to a doctor if necessary',
      color: Color.fromARGB(255, 166, 205, 205),
    ),
    ChoicesContent(
      number: '2',
      description: 'Visit to a supermarket or stores for essential supplies',
      color: Color.fromARGB(255, 238, 237, 236),
    ),
    ChoicesContent(
      number: '3',
      description: 'Visit to a bank if e-banking transactions are not possible',
      color: Color.fromARGB(255, 189, 210, 248),
    ),
    ChoicesContent(
      number: '4',
      description:
      'Visit to people needing assistance or escorting children to and from school',
      color: Color.fromARGB(255, 218, 235, 235),
    ),
    ChoicesContent(
      number: '5',
      description:
      'Attending a funeral or visiting children in case of divorce',
      color: Color.fromARGB(255, 206, 206, 167),
    ),
    ChoicesContent(
      number: '6',
      description: 'Physical exercise or getting a haircut',
      color: Color.fromARGB(255, 213, 196, 180),
    ),
  ];
}
