import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac/core/constant/app_constants.dart';
import 'package:paytac/language/localaization.dart';
import 'routes_manager.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,

        //initialRoute: AppConstants.TOKEN=='null'? RoutesConst.login:RoutesConst.home,
        initialRoute: AppRoutes.init,
      translations: LocalizationApp(),
      fallbackLocale:  Locale(AppConstants.ara),
      getPages:AppRoutes.routes,
    );
  }

}


