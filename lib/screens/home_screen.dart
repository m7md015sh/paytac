import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac/widgets/drawer/build_drawer.dart';
import 'package:paytac/widgets/slider_banner/slider.dart';

class HomeScreen extends StatelessWidget {
  //final sliderController=Get.find<SliderController>();
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,

        //   drawer: SideMenu(),
        drawer: BuildDrawer(),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.4,
                  decoration: const BoxDecoration(
                      color: Color(0xFF0dac86),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                ),
                Column(
                  //

                  children: [
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            children: [
                              IconButton(onPressed: (){_scaffoldKey.currentState!.openDrawer();}, icon: const Icon(Icons.filter_list_outlined,
                                color: Colors.white,
                                size: 28,)),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'PAYTAC',
                                  style: TextStyle(
                                    color: Colors.white, fontSize: 20,fontWeight: FontWeight.w900,),
                                ),
                              ),
                            ],
                          ),

                          const CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage('assets/images/person.jpg'),
                            backgroundColor: Colors.transparent,
                          )
                        ],
                      ),



                    ),



                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Card Balance',
                                  style: TextStyle(
                                      color: Color(0xffeeeeee), fontSize: 17),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 8,
                                        height:
                                        MediaQuery.of(context).size.height / 30,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff4bc2a6),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text('EGP',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold))),
                                      ),
                                    ),
                                    const Text(
                                      '1000.00',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4.4,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Text(
                                    'Top Up',
                                    style: TextStyle(
                                        color: Color(0xff46c1a4),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.add,
                                    color: Color(0xff46c1a4),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),


                    //
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'All Transport',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffeeeeee)),
                              )),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: const [
                              TransportCard(icon: Image(image: AssetImage('assets/images/bus_two.png'),width: 80,height: 80,)
                                  ,title: 'bus'),
                              Spacer(),
                              TransportCard(icon: Image(image: AssetImage('assets/images/train.png'),width: 80,height: 80,)
                                  ,title: 'train'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: const [
                                TransportCard(icon:Image(image: AssetImage('assets/images/bike.png'),width: 80,height: 80,)
                                    ,title: 'bike'),
                                Spacer(),
                                TransportCard(icon: Image(image: AssetImage('assets/images/taxi.png'),width: 80,height: 80,)
                                    ,title: 'taxi'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SmartCard(cardNumber: "0000 0000 0000 0000",name: "محمد شكرى محمد السيد",),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: SliderWidget(),
                    ),

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
class TransportCard extends StatelessWidget {
  final Image icon;
  final String title;
  const TransportCard({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2.3,
      height: MediaQuery.of(context).size.height/4.2,
      child: Card(
        elevation: 5.5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            icon,
            const SizedBox(
              height: 5 ,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
