import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_constants.dart';


class AuthController extends GetxController{
  var storage=const FlutterSecureStorage();
  var name=''.obs;
  var token='';
  var langStorage=const FlutterSecureStorage();
  var localLang=AppConstants.ara;


  //var token=''.obs;

  @override
  void onInit()async{
    authData();

    isAuth();
    //localLang=(await getLanguage)!;
    super.onInit();
  }

  authData()async{
    name.value=(await storage.read(key: 'name'))!;

    token=(await storage.read(key: "token"))!;
  }

  bool isAuth(){
    return  token.isNotEmpty;
  }

  doLogOut()async{
    await storage.deleteAll();
  }

  //language

  void saveLanguage(String lang)async{
     await langStorage.write(key: "lang", value: lang);
  }
  Future<String?> get getLanguage async{
    return await langStorage.read(key: "lang");
  }
  void changeLanguage(String type){
    //  saveLanguage(type);
    // Get.updateLocale(Locale(type));
    // update();
    if(localLang==type){
      return null;
    }
    if(type==AppConstants.en){
      localLang=AppConstants.en;
      // saveLanguage(AppConstants.en);
    }else{
      localLang=AppConstants.ara;
      //saveLanguage(AppConstants.ara);

    }
    update();
  }


}