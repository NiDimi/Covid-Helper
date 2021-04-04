import 'package:covid_helper/widgets/choices_grid.dart';
import 'package:covid_helper/widgets/choices_item.dart';
import 'package:covid_helper/widgets/settings_form.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 0;// Used for the bottom navigation bar 0 is for choices 1 is for settings

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectedPageIndex == 0 ? Text('Options') : Text('Settings'),
        elevation: 5.0,
      ),
      body: _selectedPageIndex == 0 ? ChoicesGrid() : SettingsForm(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Options'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Set up')
        ],
      ),
    );
  }
}
