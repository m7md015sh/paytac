import 'package:http/http.dart'as http;
import 'package:paytac/data/models/google_directions_model.dart';
class DirectionsDataService {
  static Future<GoogleDirectionsModel> getDirectionsData(double originLat,double originLong,double destinationLat,double destinationLong) async {

    var response = await http.post(

        Uri.parse("https://maps.googleapis.com/maps/api/directions/json?origin=$originLat,$originLong&destination=$destinationLat,$destinationLong&key=AIzaSyDAvoYIQHFGUdT4nOGesWpaHP4fHflAHPQ" ));

    if (response.statusCode == 200) {
      var jsonData = response.body;

      return googleDirectionsModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}