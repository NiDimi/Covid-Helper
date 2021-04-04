import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_sms/flutter_sms.dart';

class SMS with ChangeNotifier {
  static const NAME = 'name';
  static const ADDRESS = 'address';

  //setter for the name
  void updateName(newName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(NAME, newName);
  }

  //setter for the address
  void updateAddress(newAddress) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(ADDRESS, newAddress);
  }

  //getter for the name
  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(NAME) ?? '';
  }

  //getter for the address
  Future<String> getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(ADDRESS) ?? '';
  }

  //method that sends the sms
  void sendMessage(String reason) async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(NAME).toUpperCase() ?? '';
    final address = prefs.getString(ADDRESS).toUpperCase() ?? '';
    final message = reason + " " + name + " " + address;
    await sendSMS(message: message, recipients: ['13033']);
  }
}
