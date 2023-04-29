import 'package:http/http.dart' as http;
import 'package:paytac/core/constant/app_constants.dart';
import 'package:paytac/data/models/auth/login_model.dart';
import 'package:paytac/data/models/auth/signup_model.dart';

class AuthServices {
  static var client = http.Client();

  //login
  static login({required email, required password}) async {
    var response = await client.post(
      Uri.parse(AppConstants.LOGIN_URI),
      body: {"email": email, "password": password},
    );
    if (response.statusCode == 200) {
      var stringObject = response.body;
      var user = loginModelFromJson(stringObject);
      return user;
    } else {
      return null;
    }
  }

 // signup
  static signup({required firstName,required lastName,required email,required phone,required password})async{
    var response=await client.post(Uri.parse("${AppConstants.REGISTRATION_URI}"),
      headers: {'Accept':'application/json'},
      body: {"first_name":firstName,"last_name":lastName,"email":email,"password":password,"phone":phone},
    );
    if(response.statusCode==200||response.statusCode==201)
    {
      var stringObject=response.body;
      var user=signupModelFromJson(stringObject);
      return user;

    }else {
      return null;
    }

  }
}
