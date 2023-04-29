import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paytac/controllers/maps_controller.dart';
import 'package:paytac/core/constant/dimensions.dart';
import 'package:paytac/widgets/drawer/build_drawer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final mapController=Get.find<MapController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //final controller = FloatingSearchBarController();
  // final firebaseSnapshot=FirebaseFirestore.instance.collection('location').snapshots();
   Position? position;




  @override
  void initState() {
    super.initState();



    // double rotation=0;
    // if(lastPosition!=null){
     //  rotation=   Geolocator.bearingBetween(lastPosition!.latitude, lastPosition!.longitude, position!.longitude, position!.longitude);
    //
    // }
    // firebaseSnapshot.listen((event){
    //
    //
    //   event.docChanges.forEach((change){
    //     setState(() {
    //
    //       mapController.markers.add(
    //           Marker(
    //            // rotation: position.h,
    //          //   rotation: LatLng(change.doc.data()!.latitude)
    //            // rotation: (LatLng(change.doc.data()!['latitude'],change.doc.data()!['longitude']) as Position)!=null?(LatLng(change.doc.data()!['latitude'],change.doc.data()!['longitude']) as Position).heading:45,
    //               markerId: MarkerId(change.doc.id),
    //               infoWindow: InfoWindow(
    //                   title: change.doc.data()!['name'].toString()
    //               ),
    //               position: LatLng(change.doc.data()!['latitude'],change.doc.data()!['longitude']),
    //               icon: BitmapDescriptor.fromBytes(mapController.busIcon)
    //           ),
    //
    //
    //       );
    //
    //     });
    //
    //   });
    //
    // });

        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          onPressed: mapController.goToMyCurrentLocation,
          child: currentLocationIcon(),
        ),
      ),
      drawer: BuildDrawer(),
      // appBar: AppBar(
      //   title: Text(
      //     AppConstants.APP_NAME,
      //     style: TextStyle(
      //         color: Colors.black.withOpacity(0.8),
      //         fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: const Icon(
      //           Icons.menu,
      //           color: Colors.black,
      //           size: 30, // Changing Drawer Icon Size
      //         ),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       );
      //     },
      //   ),
      // ),
      body:  GetBuilder<MapController>(builder: (mapController){
        return SafeArea(
          child: Stack(
          children: [


            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: MapController.position != null
                  ? mapController.buildGoogleMap()
                  : const Center(child: CircularProgressIndicator()),
            ),
            timeAndDistance(mapController.totalDistance,mapController.totalTime),
            //buildFloatingSearchBar(),
          Positioned(
          top: 80,
          left: 20,
          right: 20,
          child:mapController.sourceTextFormField(context),
          ),
            mapController.showSourceField ? buildTextFieldToSource() : Container(),
            // notificationIcon(),
            buildBottomSheet(),

           Padding(
             padding: const EdgeInsets.all(12.0),
             child: IconButton(onPressed: (){_scaffoldKey.currentState!.openDrawer();}, icon: Icon(Icons.filter_list_outlined,
                  color: Color(0xff111111),
                  size: 28,)),
           ),


            // CustomTextFormAuth( hintText: 'hintText',  prefixIcon: Icons.account_balance_wallet, isNumber: false, valid: (String? d) { }, labelText: '', myController:controller ,)
          ],
      ),
        );},
    ));
  }




  Widget buildTextFieldToSource() {
    return Positioned(
      top: 140,
      left: 20,
      right: 20,
      child: Container(
        width: Dimensions.screenWidth,
        height: 50,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 4,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          controller: mapController.sourceController,
          readOnly: true,
          onTap: () async {
            Get.bottomSheet(Container(
              width: Dimensions.screenWidth,
              height: Dimensions.screenHeight * 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Select Your Location",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Home Address",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: Dimensions.screenWidth,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              spreadRadius: 4,
                              blurRadius: 10,
                            )
                          ]),
                      child: Row(
                        children: const [
                          Text(
                            "KDA, KOHTA",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Business Address",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: Dimensions.screenWidth,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              spreadRadius: 4,
                              blurRadius: 10,
                            )
                          ]),
                      child: Row(
                        children: const [
                          Text(
                            "tehisl, KOHTA",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                 InkWell(
                     onTap: () async {
                       Get.back();
                      mapController.searchAddressDestination(context);

                     },
                     child: Container(
                         width: Dimensions.screenWidth,
                         height: 50,
                         padding: const EdgeInsets.symmetric(horizontal: 10),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.black.withOpacity(0.03),
                                 spreadRadius: 4,
                                 blurRadius: 10,
                               )
                             ]),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: const [
                             Text(
                               "Search For Address",
                               style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 16,
                                   fontWeight: FontWeight.w600),
                               textAlign: TextAlign.start,
                             ),
                           ],
                         )),
                   ),

                ],
              ),
            ));

              mapController.showSourceField = true ;

          },
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xffA7A7A7)),
          decoration: InputDecoration(
              hintText: 'Start your trip ',
              hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 16),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              suffixIcon: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.trip_origin,
                ),
              )),
        ),
      ),
    );
  }

  Widget currentLocationIcon() {
    return const Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20, right: 17),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget notificationIcon() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30, left: 8),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }


  Widget buildBottomSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Dimensions.screenWidth * 0.8,
        height: 20,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 4,
                blurRadius: 10,
              )
            ],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(4.00)),
            width: Dimensions.screenWidth * 0.6,
            height: 4,
          ),
        ),
      ),
    );
  }
  Widget timeAndDistance(String totalDistance,String totalTime) {
    return Positioned(
        top: 10,
        left: 20,
        right: 20,
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const CircleAvatar(
              //   backgroundColor: CupertinoColors.activeGreen,
              // ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text:  TextSpan(children: [
                        TextSpan(
                            text: "$totalDistance  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "$totalTime",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ])),
                  // const Text(
                  //   "where are you going?",
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.bold),
                  // )
                ],
              )
            ],
          ),
        ));
  }



}
