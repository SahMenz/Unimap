import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newmum/widget/generalWidget/uniheader.dart';

class choosingInstitute extends StatefulWidget {
  const choosingInstitute({super.key});

  @override
  State<choosingInstitute> createState() => _choosingInstituteState();
}

class _choosingInstituteState extends State<choosingInstitute> {
  final _formKey = GlobalKey<FormState>();

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initailPosition = CameraPosition(
    target: LatLng(4.9586242340341835, 8.339407094084745),
    zoom: 14,
  );

  final List<Marker> myMarker = [];
  final List<Marker> markerList = [
    const Marker(
      markerId: MarkerId("First"),
      position: LatLng(4.9586242340341835, 8.339407094084745),
      infoWindow: InfoWindow(title: "University of Calabar"),
    ),
  ];

  @override
  void initState() {
    super.initState();
    myMarker.addAll(markerList);
    //packData();
  }

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error$error");
    });

    return await Geolocator.getCurrentPosition();
  }

  packData() {
    getUserLocation().then((value) async {
      print("MY location");
      print("${value.latitude} ${value.longitude}");

      myMarker.add(
        Marker(
          markerId: const MarkerId("second"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(
            title: "My LOcation",
          ),
        ),
      );
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14);

      final GoogleMapController controller = await _controller.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Uniheader(),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: 382,
                height: 450,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GoogleMap(
                      initialCameraPosition: _initailPosition,
                      mapType: MapType.normal,
                      markers: Set<Marker>.of(myMarker),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent, // Maintain map background
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3), // Border color
                          width: 1.0,
                        ),
                      ),
                      child: Container(),
                    ),
                    Positioned(
                      bottom: 100,
                      right: 7,
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: FloatingActionButton(
                          backgroundColor: Colors.redAccent,
                          onPressed: () {
                            packData();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.my_location,
                            color: Colors
                                .white, // Set icon color if needed (defaults to theme color)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 78,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 217),
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(BorderSide.none),
                          ),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 217),
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(BorderSide.none),
                          ),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 217),
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(BorderSide.none),
                          ),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 217),
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(BorderSide.none),
                          ),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(BorderSide.none),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                width: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        "Choose Your",
                        style: TextStyle(
                          fontFamily: "NexaDemo-Bold",
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "Institution",
                        style: TextStyle(
                          fontFamily: "NexaDemo-Bold",
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        hintStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 380,
                      height: 60,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: (_formKey.currentState != null &&
                                  _formKey.currentState!.validate())
                              ? Colors.red
                              : Colors.grey,
                          side: BorderSide.none,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontFamily: "Outfit-Medium",
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Done"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
