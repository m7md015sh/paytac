import 'package:get/get.dart';
import 'package:paytac/data/services/banner_service.dart';

class HomeController extends GetxController{
  var isLoading_sliders=true;
  var allSliderList =[];
  double current=0;

  Future getMySliders()async{
    var sliders= await GetMySlidersService.getAllSliders();

    try{
      isLoading_sliders=true;
      if(sliders.isNotEmpty){
        allSliderList.addAll(sliders);
        update();
      }
    }finally{
      isLoading_sliders=false;
      update();

    }
    update();

  }

  @override
  void onInit() {
    getMySliders();
    super.onInit();
  }




}
