import 'package:flutter/material.dart';
import 'package:emmi/constants/auth_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton.icon(onPressed: () => AuthController().signOut(), icon: Icon(Icons.logout_rounded), label: Text('Log Out')),
      
    );
  }
}