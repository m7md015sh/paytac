import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytac/core/constant/app_constants.dart';
import 'package:paytac/core/constant/routes_const.dart';

class BuildDrawer extends StatelessWidget {
  var storage=const FlutterSecureStorage();


   BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/paytac.png'),
                        fit: BoxFit.fill
                    )
                ),
              ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Good Morning",
                        style: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.28),
                          fontSize: 14,
                        ),

                      ),
                      Text("Mohamed Shokry",style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.9)
                      ),)
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                buildDrawerItem(title: "Home", onPressed: (){Get.toNamed(RoutesConst.home);}),
                buildDrawerItem(title: "Maps", onPressed: (){Get.toNamed(RoutesConst.maps);}),
                buildDrawerItem(title: "Ride History", onPressed: (){}),
                buildDrawerItem(title: "Profile", onPressed: (){Get.toNamed(RoutesConst.profile);}),
                buildDrawerItem(title: "Support", onPressed: (){}),
                buildDrawerItem(title: "LOG OUT", onPressed: ()async{
                  //controller.doLogOut();
                  Get.offNamed(RoutesConst.login);
                  AppConstants.TOKEN=="";
                  await storage.delete(key: "token");
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
  buildDrawerItem({required String title,required Function onPressed,Color color=Colors.black,double fontSize=20,FontWeight fontWeight = FontWeight.w700,double height=45}){
    return SizedBox(
      height: height,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        onTap: ()=>onPressed(),
        title: Text(title,style: GoogleFonts.poppins(fontSize: fontSize,fontWeight: fontWeight,color: color),),
      ),
    );
  }
}
