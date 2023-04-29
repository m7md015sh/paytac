import 'package:paytac/core/constant/app_constants.dart';
import 'package:paytac/data/models/slider_model.dart';
import 'package:http/http.dart'as http;

class GetMySlidersService {
  static Future<List<SliderModel>> getAllSliders() async {


    var response = await http.get(

        Uri.parse(AppConstants.SLIDER),headers: {

      "Accept":"application/json",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonData = response.body;

      return sliderModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}