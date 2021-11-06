import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Models/hotel_model.dart';
import 'package:hotel_booking/Services/nearby_api.dart';
import 'package:hotel_booking/Services/popular_api.dart';

class DashBoardController extends GetxController {
  final searchcontroller = TextEditingController();

  Future<List<HotelModel>> getpopularhotels =
      PopularHotelsRepo.getpopularhotels();
  Future<List<HotelModel>> getnearbyhotels = NearbyHotelRepo.getnearbyhotels();
}
