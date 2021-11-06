import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotel_booking/Bindings/initial_bindings.dart';
import 'package:hotel_booking/Data/page_routes.dart';
import 'Themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: 'Hotel Booking',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyScrollBehaviour(),
      initialBinding: InitialBindings(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.cupertino,
      initialRoute: '/',
      getPages: PageRoutes.pages,
    ),
  );
}

class MyScrollBehaviour extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
