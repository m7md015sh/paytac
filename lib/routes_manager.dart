import 'package:get/get.dart';
import 'package:paytac/bindings/auth/login_binding.dart';
import 'package:paytac/bindings/auth/signup_binding.dart';
import 'package:paytac/bindings/auth_binding.dart';
import 'package:paytac/bindings/home/home_binding.dart';
import 'package:paytac/bindings/maps_binding.dart';
import 'package:paytac/core/constant/routes_const.dart';
import 'package:paytac/screens/auth/forget_password.dart';
import 'package:paytac/screens/auth/login.dart';
import 'package:paytac/screens/auth/signup_screen.dart';
import 'package:paytac/screens/map/map.dart';
import 'screens/auth/verify_code/verify_register_code.dart';
import 'screens/auth/verify_code/verify_reset_code.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';


class AppRoutes{
  //initialRoute
  static const init= RoutesConst.splash;

  //get Pages
  static dynamic routes=[
    //====================================AUTH==========================================//
    GetPage(name: RoutesConst.splash, page:()=>  const SplashScreen(),bindings: [ LoginBinding(),AuthBinding()]),
    GetPage(name: RoutesConst.login, page:()=>  LoginScreen(),binding:LoginBinding() ),
    GetPage(name: RoutesConst.register, page:()=>  const SignupScreen(),binding: SignupBinding()),
    GetPage(name: RoutesConst.forgetPassword, page:()=>  const ForgetPasswordScreen(),),
    GetPage(name: RoutesConst.verifyRegisterCode, page:()=>  const VerifyRegisterCodeScreen(),),
    GetPage(name: RoutesConst.verifyResetCode, page:()=>  const VerifyResetCodeScreen(),),
    //====================================AUTH==========================================//
    GetPage(name: RoutesConst.home, page:()=>   HomeScreen(),binding: HomeBinding()),
    GetPage(name: RoutesConst.maps, page:()=>   const MapScreen(),binding: MapsBinding()),
  ];
}
