import 'package:covid_helper/providers/sms.dart';
import 'package:covid_helper/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SMS()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid Helper',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.white,
          canvasColor: Colors.white,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  fontSize: 30,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                headline2: TextStyle(
                  fontSize: 15,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
