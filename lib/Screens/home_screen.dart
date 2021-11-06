import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Controllers/homescreen_controller.dart';
import 'package:hotel_booking/Screens/dash_board.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final control = Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(builder: (_) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: control.currentscreen,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            control.changescreen(value);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: screens[control.currentscreen],
      );
    });
  }
}

List<Widget> screens = [
  const DashBoard(),
  const Scaffold(),
  const Scaffold(),
  const Scaffold(),
];
