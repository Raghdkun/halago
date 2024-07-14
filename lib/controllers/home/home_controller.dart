import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halago/core/constant/imageasset.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late GlobalKey<ScaffoldState> scaffoldKey;
  Position? cl;
   String location = "Search Location"; 
  late Placemark placemark;
  Set<Marker> marker = {};
  late GoogleMapController controller;
  var lat;
  var long;
  String? dec;
  late String street;
  CameraPosition? cam;
  late GoogleMapController gmc;
  bool showsheet = true;
  String apiKey = "AIzaSyBnpX7LyUCyyRSTXj9vYNMLJq1uhfiH0dU";
  List<Placemark> place = [];
  List<String> types = [];
  late StreamSubscription serviceStatusStream;
  final myIcon = BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)), AppImageAsset.currentlocation);
  late Completer<GoogleMapController>? completercontroller;

  getPlaces() async {
    // return p ;

    // components: [new Component(Component.country, "fr")]);
  }

  updateLocationText(position) async {
    // Use geocoding to get the placemark from the position
    place =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    update();
  }

  Future<Uint8List> getBytesFromAsset(
      {required String path, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  iconFun() async {
    final Uint8List customMarker = await getBytesFromAsset(
        path: AppImageAsset.normalcar, //paste the custom image path
        width: 50 // size of custom image as marker
        );
    marker.add(Marker(
        markerId: MarkerId("currentlocation"),
        icon: BitmapDescriptor.fromBytes(customMarker),
        draggable: true,
        position: LatLng(cl!.latitude, cl!.longitude),
        onTap: () {
          showsheet = true;

          update();
        }));
  }

  // search() async {
  //   var place = await PlacesAutocomplete.show(
  //       context: Get.context!,
  //       apiKey: apiKey,
  //       mode: Mode.overlay,
  //       types: [],
  //       strictbounds: false,
  //       // components: [Component(Component.country, 'np')],
  //       //google_map_webservice package
  //       onError: (err) {
  //         print(err);
  //       });

  //   if (place != null) {
  //     location = place.description.toString();
  //     update(); 

  //     //form google_maps_webservice package
  //     final plist = GoogleMapsPlaces(
  //       apiKey: apiKey,
  //       apiHeaders: await GoogleApiHeaders().getHeaders(),
  //       //from google_api_headers package
  //     );
  //     String placeid = place.placeId ?? "0";
  //     final detail = await plist.getDetailsByPlaceId(placeid);
  //     final geometry = detail.result.geometry!;
  //     final lat = geometry.location.lat;
  //     final lang = geometry.location.lng;
  //     var newlatlang = LatLng(lat, lang);

  //     //move map camera to selected place with animation
  //     controller.animateCamera(CameraUpdate.newCameraPosition(
  //         CameraPosition(target: newlatlang, zoom: 17)));
  //   }
  // }

  // currenlocationMarker() async {
  //   //  iconFun();
  //   marker.add(Marker(
  //       markerId: MarkerId("currentlocation"),
  //       icon: customMarker,
  //       draggable: true,
  //       position: LatLng(cl!.latitude, cl!.longitude),
  //       onTap: () {
  //         showsheet = true;

  //         update();
  //       }));

  //   // gmc.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 18.5746));
  //   update();
  // }

  addMarker(position) {
    lat = cl!.latitude;
    long = cl!.longitude;
    // gmc.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 18.5746));
    marker.remove("newride");
    update();
    marker.add(Marker(
        markerId: MarkerId("newride"),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        draggable: true,
        position: position,
        onTap: () {
          showsheet = true;

          update();
        }));
    // gmc.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 18.5746));

    update();
  }

  Future<void> getLatAndLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl!.latitude;
    long = cl!.longitude;
    cam = await CameraPosition(
      target: LatLng(lat, long),
      zoom: 17.4746,
    );
    update();
  }

  myCurrentLocation() {
    lat = cl!.latitude;
    long = cl!.longitude;
    gmc.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 18.5746));
    marker.clear();
    marker.add(Marker(
        markerId: MarkerId("newride"),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        draggable: true,
        position: LatLng(cl!.latitude, cl!.longitude),
        onTap: () {
          showsheet = true;

          update();
        }));
  }

  getCity() async {
    place = await placemarkFromCoordinates(cl!.latitude, cl!.longitude);
    // print(placemark[0].street);
  }

  distance() {
    double distanceBetween = Geolocator.distanceBetween(
        cl!.altitude, cl!.longitude, 33.489420, 36.306942);
    int km = distanceBetween.toInt();
    double distanceInKm = km / 1000;
    print(distanceBetween);

    print("$distanceInKm KM");
  }

  // Future<BitmapDescriptor>iconFun(){
  //   myIcon = BitmapDescriptor.fromAssetImage(
  //         ImageConfiguration(size: Size(48, 48)), AppImageAsset.currentlocation) ;
  //     return myIcon ;

  // }

  CurrentLocation() async {
    // bool services;
    LocationPermission? permission;
    // services = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always) {
        getLatAndLong();
        update();
      }
    }
    return permission;
  }

  stateStream() {
    serviceStatusStream =
        Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      print("============= $status");
      update();
    });
  }

  @override
  void onInit() async {
    scaffoldKey = GlobalKey<ScaffoldState>();
    animationController = AnimationController(vsync: this);
    completercontroller = Completer<GoogleMapController>();
    cl = await Geolocator.getCurrentPosition();
    stateStream();

// gmc = GoogleMapController.init() ;
    // getCurrentLocation();
    // myCurrentLocation();
    CurrentLocation();
    getLatAndLong();
    getCity();
    // currenlocationMarker();
    iconFun();
    placemark = Placemark();

    super.onInit();
  }
}
