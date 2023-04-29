import 'package:get/get.dart';
import 'package:paytac/controllers/maps_controller.dart';


class  MapsBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(MapController());
  }

}