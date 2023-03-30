import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:with_you/view/LoginPage.dart';
import 'package:with_you/view/accountPage.dart';
import 'package:with_you/view/createEvent.dart';
import 'package:with_you/view/disasterPage.dart';
import 'package:with_you/view/listEvent.dart';
import 'package:with_you/view/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;

  @override
  void initState() {
    _selectedWidget = MainPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _selectedWidget,
        bottomNavigationBar: DiamondBottomNavigation(
          itemIcons: const [
            Icons.home,
            Icons.search,
            Icons.account_circle_rounded,
            Icons.warning,
          ],
          centerIcon: Icons.add,
          selectedIndex: _selectedIndex,
          onItemPressed: onPressed,
        ),
      ),
    );
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = const MainPage();
      } else if (index == 1) {
        _selectedWidget = const EventList();
      } else if (index == 2) {
        _selectedWidget = const CreateEventPage();
      } else if (index == 3) {
        _selectedWidget = AccountPage();
      } else if (index == 4) {
        _selectedWidget = LoginForm();
      }
    });
  }
}
