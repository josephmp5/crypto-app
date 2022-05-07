import 'package:emmi/ui/screen/crypto_home_page.dart';
import 'package:emmi/ui/screen/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:emmi/constants.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  onPageChanged(int page) {
    setState(() {
      pageIdx = page;
    });
  }

  List pages = [
  CryptoHomePage(),
  Text('Messages Screen'),
  SettingsPage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[pageIdx],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundColor,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.blueAccent,
            onTap: onPageChanged,
            currentIndex: pageIdx,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  size: 30,
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.logout_outlined,
                  size: 30,
                ),
                label: 'Log Out',
              ),
            ]),
        );
  }
}
