import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac/controllers/home_controller.dart';
import 'package:paytac/controllers/text_controller.dart';
import 'package:paytac/core/constant/dimensions.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final sliderController = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => sliderController.isLoading_sliders
          ? Container(
              height: 190,
            )
          : Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              width: Dimensions.screenWidth,
              child: Column(
                children: [
                  SizedBox(
                    width: Dimensions.screenWidth,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: sliderController.allSliderList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://api.amadagency.net/storage/${sliderController.allSliderList[index].image}',
                                ),
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
