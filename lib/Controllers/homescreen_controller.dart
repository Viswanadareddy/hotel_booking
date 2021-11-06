import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  int currentscreen = 0;

  void changescreen(value) {
    currentscreen = value;
    update();
  }
}
