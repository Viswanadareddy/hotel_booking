import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Models/hotel_model.dart';

class HotelDetailsController extends GetxController
    with SingleGetTickerProviderMixin {
  final HotelModel data = Get.arguments;

  late TabController tabcontroller;
  int currentTab = 0;

  @override
  void onInit() {
    tabcontroller = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabcontroller.dispose();

    super.dispose();
  }

  changetab(value) {
    currentTab = value;
    update();
  }
}
