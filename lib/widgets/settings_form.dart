import 'package:covid_helper/providers/sms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _form = GlobalKey<FormState>();// The form that will be used to add the values
  final _addressFocusNode = FocusNode();// Used for passing the focus from name to address
  SMS _smsObj;// The sms object that holds previous values for name and address
  final _nameController = TextEditingController();// Controller for the name text field
  final _addressController = TextEditingController();// Controller for the address text file

  @override
  void initState() {
    super.initState();
    _smsObj = Provider.of<SMS>(context, listen: false);
    _smsObj.getName().then((value) {
      setState(() {
        _nameController.text = value;
      });
    });
    _smsObj.getAddress().then((value) {
      setState(() {
        _addressController.text = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _addressFocusNode.dispose();
    _addressController.dispose();
    _nameController.dispose();
  }

  //Used for submitting the form and passing the values to the sms obj
  Future<void> _submitForm() async {
    FocusScope.of(context).unfocus();
    _form.currentState.save();
    _smsObj.updateName(_nameController.text);
    _smsObj.updateAddress(_addressController.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Your name and address have been changed successfully',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Your Name'),
              controller: _nameController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_addressFocusNode);
              },
              onSaved: (newValue) => _nameController.text = newValue,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Your Address'),
              controller: _addressController,
              textInputAction: TextInputAction.done,
              maxLines: 2,
              focusNode: _addressFocusNode,
              onFieldSubmitted: (_) {
                _submitForm();
              },
              onSaved: (newValue) => _addressController.text = newValue,
            ),
            ElevatedButton(
              child: Text('Submit'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor:
                    MaterialStateProperty.all(Theme.of(context).accentColor),
              ),
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
