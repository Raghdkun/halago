import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halago/controllers/home/home_controller.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/widgets/customdrawer.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controllmap = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        key: controllmap.scaffoldKey,
        extendBodyBehindAppBar: true,
    //     appBar: AppBar(
    
    // shape: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(15), 
    //   borderSide: BorderSide.none
      
    // ),
    //       // backgroundColor: Colors.transparent,
    //       elevation: 0,
    //     ),
        drawer: CustomDrawer(),
        resizeToAvoidBottomInset: true,
        bottomSheet: GetBuilder<HomeController>(
            builder: (controller) => controller.showsheet == true
                ? BottomSheet(
                    animationController: controllmap.animationController,
                    elevation: 10,
                    onClosing: () {},
                    builder: (context) => Container(
                      height: Get.height / 3.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          ListTile(
                            onTap: () {
                              controllmap.myCurrentLocation();
                            },
                            title: Text("My Current Location"),
                            subtitle: Text("PICK UP"),
                            leading: Icon(
                              FontAwesomeIcons.check,
                              size: 32,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (controller.place.isNotEmpty)
                            ...List.generate(
                                1,
                                ((index) => ListTile(
                                      title: Text(
                                          "${controller.place[2].street} ${controller.place[1].locality} ${controller.place[index].isoCountryCode}"),
                                      leading: Icon(
                                        FontAwesomeIcons.locationDot,
                                        size: 32,
                                        color: Colors.red,
                                      ),
                                    )))
                        ]),
                      ),
                    ),
                  )
                : Container(
                    height: 0,
                  )),
        body: GetBuilder<HomeController>(
          builder: (controller) => Container(
            child: SafeArea(
              child: Stack(
                children: [
                  controller.cam != null
                      ? GoogleMap(
                          mapToolbarEnabled: true,
                          myLocationButtonEnabled: true,
                          myLocationEnabled: true,
                          trafficEnabled: true,
                          mapType: MapType.normal,
                          markers: controllmap.marker,
                          onTap: (latlong) {
                            // controllmap.myCurrentLocation(); 
                            controllmap.addMarker(latlong);
                            controllmap.updateLocationText(latlong);
                          },
                          initialCameraPosition: controller.cam!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.completercontroller!
                                .complete(controllermap);
                            controller.gmc = controllermap;
                          },
                        )
                      : Center(child: CircularProgressIndicator()),
                  Positioned(
                      bottom: 10,
                      left: 8,
                      child: MaterialButton(
                        onPressed: () async {
                          // await controller.getCity();
                          controllmap.distance();
                          print(controller.cl!.longitude);
                          print(controller.cl!.latitude);
                          controllmap.gmc.animateCamera(
                              CameraUpdate.newLatLngZoom(
                                  LatLng(33.489420, 36.306942), 18.4746));
                        },
                        onLongPress: () async {
                          var xy = await controllmap.gmc
                              .getLatLng(ScreenCoordinate(x: 350, y: 350));
                          controllmap.gmc.animateCamera(
                              CameraUpdate.newLatLngZoom(
                                  LatLng(controllmap.cl!.latitude,
                                      controllmap.cl!.longitude),
                                  18.4746));
    
                          print(xy);
                        },
                        child: Text("haha"),
                      )),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            controllmap.getPlaces(); 
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.search),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          controllmap.scaffoldKey.currentState?.openDrawer();
                        },
                        child: Card(
                          child: Container(
                              width: 40, height: 40, child: Icon(Icons.list)),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
