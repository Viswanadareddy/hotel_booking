import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/Constants/constants.dart';
import 'package:hotel_booking/Controllers/hoteldetails_controller.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final control = Get.put(HotelDetailsController());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: _buildImage(
                  context: context,
                  imageurl: control.data.hotelImage,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      control.data.hotelName,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Constants.ksecondarycolor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade700,
                      size: 22,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      control.data.rating.toString(),
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '(25)',
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 5)),
              SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      control.data.hotelLocation,
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Text(
                  'Details',
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Constants.ksecondarycolor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(child: _buildDetails()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: _facilities
                        .map((name, icon) => MapEntry(
                            name, _buildFacilitiesTile(name: name, icon: icon)))
                        .values
                        .toList(),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: TabBar(
                  controller: control.tabcontroller,
                  onTap: (value) {
                    control.changetab(value);
                  },
                  tabs: const [
                    Tab(
                      child: Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<HotelDetailsController>(builder: (_) {
                return SliverToBoxAdapter(
                  child: control.currentTab == 0
                      ? _buildDescription()
                      : control.currentTab == 1
                          ? _buildlocation()
                          : control.currentTab == 2
                              ? _buildreviews(control)
                              : Container(),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 70,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  text: '\$${control.data.price}/',
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Constants.kprimarycolor,
                    ),
                  ),
                  children: const [
                    TextSpan(
                      text: 'per night',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              MaterialButton(
                height: 60,
                color: Constants.kprimarycolor,
                minWidth: MediaQuery.of(context).size.width * 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Book Now",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_buildDescription() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      'A hotel is an establishment that provides paid lodging on a short-term basis. ... Hotel rooms are usually numbered (or named in some smaller hotels and B&Bs) to allow guests to identify their room. Some boutique, high-end hotels have custom decorated rooms. Some hotels offer meals as part of a room and board arrangement.',
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 15,
      ),
    ),
  );
}

_buildlocation() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: const Image(
        fit: BoxFit.cover,
        image: NetworkImage(
          'https://docs.microsoft.com/en-us/azure/azure-maps/media/migrate-google-maps-web-app/google-maps-marker.png',
        ),
      ),
    ),
  );
}

_buildreviews(control) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: index == 0 ? 0 : 10),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      minRadius: 12,
                      child: Icon(Icons.person),
                      backgroundColor: Constants.kprimarycolor,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Katherine',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade700,
                      size: 22,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      control.data.rating.toString(),
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'They were extremely accommodating and allowed us to check in early at like 10am. We got to hotel super early and I didn’t wanna wait. So this was a big plus. The sevice was exceptional as well. Would definitely send a friend there',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          );
        }),
  );
}

_buildImage({required BuildContext context, required String imageurl}) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(
          height: MediaQuery.of(context).size.height * 0.47,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          image: NetworkImage(imageurl),
        ),
      ),
      const Positioned(
        top: 5,
        left: 5,
        child: BackButton(
          color: Colors.white,
        ),
      ),
      const Positioned(
        right: 15,
        top: 15,
        child: Icon(
          Icons.favorite_outline,
          color: Colors.white,
        ),
      ),
    ],
  );
}

_buildDetails() {
  return const Text(
    '4 guests • 2 bedrooms • 2 beds • 1 bath',
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget _buildFacilitiesTile({required String name, required IconData icon}) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    alignment: Alignment.center,
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(height: 10),
        Text(name),
      ],
    ),
  );
}

Map<String, IconData> _facilities = {
  'Wi-Fi': Icons.signal_wifi_4_bar,
  'TV': Icons.tv,
  'Dinner': Icons.local_dining_rounded,
  'Pool': Icons.pool_rounded,
  'Parking': Icons.local_parking,
  "Room Service": Icons.room_service_rounded,
  'Security': Icons.security,
};

Widget _buildtabBar(control) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TabBar(
        controller: control.tabcontroller,
        // isScrollable: true,
        tabs: const [
          Tab(
            child: Text(
              'Description',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Location',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Reviews',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      Flexible(
        child: TabBarView(
          controller: control.tabcontroller,
          children: [
            Container(
              height: 500,
              width: 300,
              color: Colors.pink,
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    ],
  );
}
