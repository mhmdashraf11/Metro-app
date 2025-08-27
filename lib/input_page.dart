import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:metro2/functions.dart';
import 'package:metro2/main.dart';
import 'full_details.dart';
import 'station_class.dart';

// Station(name: "Abbassiya", lat: 30.07213, long: 31.28333),
// Station(name: "Abdou Pasha", lat: 30.06500, long: 31.27474),
// Station(name: "Adly Mansour", lat: 30.14717, long: 31.42133),
// Station(name: "Ain Helwan", lat: 29.86281, long: 31.32489),
// Station(name: "Ain Shams", lat: 30.13119, long: 31.31907),
// Station(name: "Al Ahram", lat: 30.09185, long: 31.32634),
// Station(name: "Alf Maskan", lat: 30.11918, long: 31.34017),
// Station(name: "Attaba", lat: 30.05252, long: 31.24680),
// Station(name: "Bab El Shaaria", lat: 30.05423, long: 31.25588),
// Station(name: "Boulak El Dakrour", lat: 30.03772, long: 31.19556),
// Station(name: "Cairo University", lat: 30.02616, long: 31.20114),
// Station(name: "Dar El Salam", lat: 29.98224, long: 31.24224),
// Station(name: "Dokki", lat: 30.03860, long: 31.21218),
// Station(name: "El Bohoth", lat: 30.03596, long: 31.20016),
// Station(name: "El Demerdash", lat: 30.07735, long: 31.27783),
// Station(name: "El Geish", lat: 30.06192, long: 31.26686),
// Station(name: "El Haykestep", lat: 30.14398, long: 31.40470),
// Station(name: "El Maadi", lat: 29.96042, long: 31.25770),
// Station(name: "El Malek El Saleh", lat: 30.01785, long: 31.23103),
// Station(name: "El Marg", lat: 30.16396, long: 31.33832),
// Station(name: 'El-Maasara', lat: 29.90624, long: 31.29952),
// Station(name: "El Matariya", lat: 30.12148, long: 31.31370),
// Station(name: "El Mounib", lat: 29.98127, long: 31.21232),
// Station(name: "El Nozha", lat: 30.12815, long: 31.36016),
// Station(name: "El Qawmia", lat: 30.09329, long: 31.20914),
// Station(name: "El Sayeda Zeinab", lat: 30.02943, long: 31.23542),
// Station(name: "El Shohadaa", lat: 30.06147, long: 31.24617),
// Station(name: "El Zahraa", lat: 29.99559, long: 31.23114),
// Station(name: "El-Bohy", lat: 30.08451, long: 31.21128),
// Station(name: "Ezbet El-Nakhl", lat: 30.13948, long: 31.32441),
// Station(name: "Fair Zone", lat: 30.07392, long: 31.30147),
// Station(name: "Faisal", lat: 30.01723, long: 31.20397),
// Station(name: "Gamat El Dowal", lat: 30.05029, long: 31.19896),
// Station(name: "Ghamra", lat: 30.06918, long: 31.26461),
// Station(name: "Giza", lat: 30.01073, long: 31.20708),
// Station(name: "Hadayek El Maadi", lat: 29.97040, long: 31.25051),
// Station(name: "Hadayek El Zaitoun", lat: 30.10602, long: 31.31047),
// Station(name: "Hadayek Helwan", lat: 29.89743, long: 31.30409),
// Station(name: 'Hamamat El Qobba', lat: 30.09133, long: 31.29891),
// Station(name: "Haroun", lat: 30.10154, long: 31.33293),
// Station(name: "Heliopolis", lat: 30.10855, long: 31.33828),
// Station(name: "Helmeyet El Zeitoun", lat: 30.11399, long: 31.31413),
// Station(name: "Helwan", lat: 29.85055, long: 31.33398),
// Station(name: "Helwan University", lat: 29.86960, long: 31.32006),
// Station(name: "Hesham Barakat", lat: 30.13103, long: 31.37294),
// Station(name: "Imbaba", lat: 30.07602, long: 31.20746),
// Station(name: "Kit Kat", lat: 30.06672, long: 31.21301),
// Station(name: "Khalafawy", lat: 30.09740, long: 31.24547),
// Station(name: 'Kobry El Qobba', lat: 30.08732, long: 31.29409),
// Station(name: "Koliet El Zeraa", lat: 30.11386, long: 31.24865),
// Station(name: "Kolleyet El Banat", lat: 30.08358, long: 31.32883),
// Station(name: "Kozzika", lat: 29.93644, long: 31.28178),
// Station(name: "Manshiet El Sadr", lat: 30.08212, long: 31.28751),
// Station(name: "Mar Girgis", lat: 30.00716, long: 31.22983),
// Station(name: "Masarra", lat: 30.07105, long: 31.24508),
// Station(name: "Maspero", lat: 30.05581, long: 31.23207),
// Station(name: "Mezallat", lat: 30.10428, long: 31.24562),
// Station(name: "Nadi El Shams", lat: 30.12598, long: 31.34879),
// Station(name: "Naguib", lat: 30.04549, long: 31.24414),
// Station(name: "Nasser", lat: 30.05276, long: 31.24082),
// Station(name: "New Marg", lat: 30.16380, long: 31.33834),
// Station(name: "Omar Ibn El Khattab", lat: 30.14020, long: 31.39287),
// Station(name: "Omm El-Masryeen", lat: 30.00577, long: 31.20810),
// Station(name: "Opera", lat: 30.04211, long: 31.22495),
// Station(name: "Orabi", lat: 30.05683, long: 31.24208),
// Station(name: "Qobaa", lat: 30.08865, long: 31.29393),
// Station(name: "Ring Road", lat: 30.09656, long: 31.19946),
// Station(name: "Rod El Farag", lat: 30.08075, long: 31.24540),
// Station(name: "Rod El Farag Corridor", lat: 30.10207, long: 31.18439),
// Station(name: "Sadat", lat: 30.04375, long: 31.23585),
// Station(name: "Saad Zaghloul", lat: 30.03716, long: 31.23839),
// Station(name: "Safaa Hegazy", lat: 30.06261, long: 31.22260),
// Station(name: "Sakiat Mekky", lat: 29.99561, long: 31.20868),
// Station(name: "Sakanat El Maadi", lat: 29.95330, long: 31.26297),
// Station(name: "Saray El Qobba", lat: 30.09779, long: 31.30454),
// Station(name: "Shubra El Kheima", lat: 30.12257, long: 31.24453),
// Station(name: "St. Teresa", lat: 30.08812, long: 31.24548),
// Station(name: "Stadium", lat: 30.07293, long: 31.31706),
// Station(name: "Sudan", lat: 30.07013, long: 31.20446),
// Station(name: "Tawfikia", lat: 30.06508, long: 31.20239),
// Station(name: "Tora El-Asmant", lat: 29.92610, long: 31.28753),
// Station(name: "Tora El-Balad", lat: 29.94693, long: 31.27297),
// Station(name: "Wadi El Nile", lat: 30.05851, long: 31.20102),
// Station(name: "Wadi Hof", lat: 29.87923, long: 31.31354),
class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final time = ''.obs;

  final price = ''.obs;

  final count = ''.obs;

  final show = false.obs;

  final nearestStation = ''.obs;

  final stationFromAdd = ''.obs;
  // final stationsNames=<String>[].obs;
  final RxList<StationClass> stations = <StationClass>[].obs;

  List<List<String>> routes = [];

  final entryCont = TextEditingController();

  final DestinationCont = TextEditingController();

  final addressCont = TextEditingController();

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar(
        'Error',
        'Location services are disabled.',
        backgroundColor: Colors.red.withValues(alpha: 0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 12,
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: Duration(seconds: 3),
        isDismissible: true,
      );

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar(
          'Error',
          'Location services are denied.',
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 12,
          margin: EdgeInsets.all(10),
          icon: Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          duration: Duration(seconds: 3),
          isDismissible: true,
        );
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Get.snackbar('Error', '')
      Get.snackbar(
        'Error',
        'Location permissions are permanently denied, we cannot request permissions.',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 12,
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: Duration(seconds: 3),
        isDismissible: true,
      );
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadStations();
  }

  Future<void> loadStations() async {
    final data = await database.stationDao.selectStations();
    // stations.addAll(StationClass(name: data.name, lat: data.latitude, long: data.longtude));
    for (var value in data) {
      stations.add(
        StationClass(
          name: value.name,
          lat: value.latitude ?? 0.0,
          long: value.longitude ?? 0.0,
        ),
      );
      print("Loaded stations: ${stations.last.long}");
    }
    // print("Loaded stations: ${stations}");
  }
  // Future<void> loadStations() async {
  //   final data = await database.stationDao.selectStations();
  //   stations.assignAll(
  //     data.map(
  //       (value) => StationClass(
  //         name: value.name,
  //         lat: value.latitude ?? 0.0,
  //         long: value.longtude ?? 0.0,
  //       ),
  //     ),
  //   );
  //   print("Loaded stations: ${stations.length}");
  // }

  // [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Metro Guide',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: Color(0xFFc41014),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter the Entry point',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Obx(() {
                  return DropdownMenu(
                    controller: entryCont,
                    enableFilter: true,
                    enableSearch: true,
                    requestFocusOnTap: true,
                    hintText: 'Start Point',
                    menuHeight: 300,
                    width: double.infinity,
                    dropdownMenuEntries: [
                      for (var station in stations)
                        DropdownMenuEntry(
                          value: station.name,
                          label: station.name,
                        ),
                    ],

                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFc41014),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFc41014),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFc41014),
                          width: 2,
                        ),
                      ),
                    ),
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Color(0xFFc41014),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  );
                }),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Enter the Destination point',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return DropdownMenu(
                    controller: DestinationCont,
                    menuHeight: 300,
                    enableFilter: true,
                    enableSearch: true,
                    requestFocusOnTap: true,
                    hintText: 'End Point',
                    width: double.infinity,
                    dropdownMenuEntries: [
                      for (var station in stations)
                        DropdownMenuEntry(
                          value: station.name,
                          label: station.name,
                        ),
                    ],
                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFc41014),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFc41014),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFc41014),
                          width: 2,
                        ),
                      ),
                    ),
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Color(0xFFc41014),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  );
                }),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (entryCont.value != DestinationCont.value) {
                          routes = Metro().allRoutes(
                            entryCont.text,
                            DestinationCont.text,
                          );
                        } else {
                          Get.snackbar(
                            'Error',
                            'Enter different stations',
                            backgroundColor: Colors.red.withOpacity(0.8),
                            colorText: Colors.white,
                            snackPosition: SnackPosition.TOP,
                            borderRadius: 12,
                            margin: EdgeInsets.all(10),
                            icon: Icon(Icons.error, color: Colors.white),
                            shouldIconPulse: true,
                            duration: Duration(seconds: 3),
                            isDismissible: true,
                          );
                        }
                        if (routes.isNotEmpty) {
                          final minRoute = routes.minBy(
                            (route) => route.length,
                          )!;
                          count.value =
                              'Number of stations : ${Metro().stationCount(minRoute)}';
                          time.value =
                              'Estimated time : ${Metro().expectedTimeMin(minRoute)}';
                          price.value = 'Price : ${Metro().Price(minRoute)}';
                          show.value = true;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFc41014),
                      ),
                      child: Text(
                        'Show',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return Align(
                    alignment: Alignment.center,
                    child: Card(
                      // color: Colors.red.shade50,
                      color: Color(0xFFF5F5F5),
                      // color: Colors.grey[200],
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (count.value != '')
                            Row(
                              children: [
                                Icon(Icons.train),
                                Text(
                                  ' ${count.value}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          if (time.value != '')
                            Row(
                              children: [
                                Icon(Icons.timer),
                                Text(
                                  ' ${time.value}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          if (price.value != '')
                            Row(
                              children: [
                                Icon(Icons.attach_money),
                                Text(
                                  ' ${price.value}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                }),
                Obx(() {
                  return Visibility(
                    visible: show.value,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFc41014),
                        ),
                        onPressed: () {
                          Get.to(() => FullDetails(), arguments: routes);
                        },
                        label: Text(
                          'See more',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(Icons.chevron_right, color: Colors.white),
                      ),
                    ),
                  );
                }),
                // Spacer()
                Obx(() {
                  return Visibility(
                    visible: !show.value,
                    child: SizedBox(height: 120, width: double.infinity),
                  );
                }),

                Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFc41014),
                          ),
                          onPressed: () async {
                            final pos = await getPosition();
                            final lat = pos.latitude;
                            final long = pos.longitude;
                            print('${lat},${long}');
                            nearestStation.value = stations[0].name;
                            var min = double.infinity;
                            for (var station in stations) {
                              if (Geolocator.distanceBetween(
                                    lat,
                                    long,
                                    station.lat,
                                    station.long,
                                  ) <
                                  min) {
                                min = Geolocator.distanceBetween(
                                  lat,
                                  long,
                                  station.lat,
                                  station.long,
                                );
                                nearestStation.value = station.name;
                                // print('${nearestStation.value}');
                              }
                            }
                            entryCont.text = nearestStation.value;
                          },
                          child: Text(
                            'Nearest Station',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        // SizedBox(width: 10),
                        Obx(() {
                          return Text(
                            nearestStation.value,
                            style: TextStyle(fontSize: 20),
                          );
                        }),
                      ],
                    ),
                    TextField(
                      controller: addressCont,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Color(0xFFc41014)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFc41014),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFc41014),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFc41014),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFc41014),
                            ),
                            onPressed: () async {
                              try {
                                final locations = await locationFromAddress(
                                  addressCont.text,
                                );
                                if (locations.isEmpty) {
                                  Get.snackbar(
                                    'Error',
                                    'No location found for this address',
                                  );
                                  return;
                                }
                                final lat = locations.first.latitude;
                                final long = locations.first.longitude;

                                stationFromAdd.value = stations[0].name;
                                var min = double.infinity;

                                for (var station in stations) {
                                  final dist = Geolocator.distanceBetween(
                                    lat,
                                    long,
                                    station.lat,
                                    station.long,
                                  );
                                  if (dist < min) {
                                    min = dist;
                                    stationFromAdd.value = station.name;
                                  }
                                }
                                DestinationCont.text = stationFromAdd.value;
                              } catch (e) {
                                Get.snackbar('Error', 'Failed to get location');
                              }
                            },
                            child: Text(
                              'Show Station',
                              style: TextStyle(
                                // fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Obx(() {
                          return Expanded(
                            child: Center(
                              child: Text(
                                stationFromAdd.value,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
