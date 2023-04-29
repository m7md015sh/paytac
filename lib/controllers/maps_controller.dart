import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'dart:ui' as ui;
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:paytac/core/classes/location_helper.dart';
import 'package:paytac/core/constant/colors.dart';
import 'package:paytac/core/constant/dimensions.dart';
import 'package:paytac/data/services/directions_data_service.dart';
import 'package:flutter_google_places/flutter_google_places.dart';



class MapController extends GetxController {
  @override
  void onInit() {
    //firebaseLiveLocation();
    getCurrentLocation();
    loadCustomMarker();

    super.onInit();
  }
  final Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 15.4746);
  static Position? position;

  final Set<Polyline> _polyLine = {};
  Set<Marker> markers = Set<Marker>();
  late Uint8List markIcons;
  late Uint8List busIcon;
  late LatLng destination;
  late LatLng source;
  String totalDistance="";
  String totalTime="";
  var showSourceField = true;
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  bool nearByAvailableDriverKeysLoaded=false;
  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController currentMapController =
    await _mapController.future;
    currentMapController.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
    update();
  }
  Future<void> getCurrentLocation() async {
    await LocationHelper.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      update();
    });
  }
   buildGoogleMap(){
   return GoogleMap(

      markers: markers,
      polylines: _polyLine,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        //initGeoFireListener();
        _mapController.complete(controller);
      },

    );

  }
  loadCustomMarker() async {
    markIcons = await loadAsset('assets/icons/flag.png', 100);
    busIcon = await loadAsset('assets/icons/bus.png', 80);
  }
  Future<Uint8List> loadAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();

  }
  Future directionsResponse()async{

    var directions= await DirectionsDataService.getDirectionsData(source.latitude,source.longitude, destination.latitude,destination.longitude);

    try{
      // isLoading_profile.value=true;



    }finally{
      totalDistance=directions.routes[0].legs[0].distance.text;
      totalTime=directions.routes[0].legs[0].duration.text;
      _polyLine.clear();
      for(int i=0;i<directions.routes[0].legs[0].steps.length;i++){
        _polyLine.add(Polyline(polylineId: PolylineId(directions.routes[0].legs[0].steps[i].polyline.points),points: [

          LatLng(directions.routes[0].legs[0].steps[i].startLocation.lat, directions.routes[0].legs[0].steps[i].startLocation.lng),
          LatLng(directions.routes[0].legs[0].steps[i].endLocation.lat, directions.routes[0].legs[0].steps[i].endLocation.lng),
        ],width: 5,color: AppColors.mainDarkColor),
        );
      }





    }
    update();
  }
  Widget sourceTextFormField(BuildContext context){
    return Container(
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
        controller: destinationController,
        readOnly: true,
        onTap: () async {
          Prediction? p = await showGoogleAutoComplete(context);
          String selectedPlace = p!.description!;
          destinationController.text = selectedPlace;
          List<geocoding.Location> locations =
          await geocoding.locationFromAddress(selectedPlace);
          destination =
              LatLng(locations.first.latitude, locations.first.longitude);
         markers.add(Marker(
              markerId: MarkerId(selectedPlace),
              infoWindow: InfoWindow(title: 'Distination: $selectedPlace'),
              position: destination,
              icon: BitmapDescriptor.fromBytes(markIcons)));

          final GoogleMapController controller = await _mapController.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: destination, zoom: 15.47)));



          showSourceField = true;
          update();

        },
        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xffA7A7A7)),
        decoration: InputDecoration(
            hintText: 'Search for a destination',
            hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 16),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
              ),
            )),
      ),
    );

  }
  Future<Prediction?> showGoogleAutoComplete(BuildContext context) async {
    const kGoogleApiKey = "AIzaSyDAvoYIQHFGUdT4nOGesWpaHP4fHflAHPQ";

    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      region: "eg",
      language: "ar",
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      components: [Component(Component.country, "eg")],
      types: ["(cities)"],
      hint: "Search City",
    );
    [
      //add this
      Component(Component.country, "en"),
      Component(Component.country, "ar"),
      Component(Component.country, "UK")
    ];
    return p;
  }
  Future<void> searchAddressDestination(BuildContext context)async{
    Prediction? p = await showGoogleAutoComplete(context);
    String placeName = p!.description!;
    sourceController.text = placeName;

    List<geocoding.Location> locations =
        await geocoding.locationFromAddress(placeName);
    if ( markers.length >= 2) {
      markers.remove( markers.last);
    }
    source = LatLng(
        locations.first.latitude, locations.first.longitude);
   markers.add(Marker(
        markerId: MarkerId(placeName),
        infoWindow: InfoWindow(title: 'Source: $placeName'),
        position:  source));
    directionsResponse();
    //drawPolyline(placeName);
    final GoogleMapController controller =
        await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target:   source, zoom: 15.47)));
  }
  //  firebaseLiveLocation(){
  //   FirebaseFirestore.instance.collection('location').snapshots().listen((event){
  //
  //
  //     event.docChanges.forEach((change){
  //
  //
  //         markers.add(
  //           Marker(
  //             //rotation: (LatLng(change.doc.data()!['latitude'],change.doc.data()!['longitude']) as Position)!=null?(LatLng(change.doc.data()!['latitude'],change.doc.data()!['longitude']) as Position).heading:45,
  //               markerId: MarkerId(change.doc.id),
  //               infoWindow: InfoWindow(
  //                   title: change.doc.data()!['name'].toString()
  //               ),
  //               position: LatLng(change.doc.data()!['latitude'],change.doc.data()!['longitude']),
  //               icon: BitmapDescriptor.fromBytes(busIcon)
  //           ),
  //
  //
  //         );
  //
  //
  //
  //     });
  //
  //   });
  //
  // }


  static final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 15.4746);

}