import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final controller = Get.put(getController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<getController>(
      init: getController(),
      builder: (v){
        return Scaffold(
          backgroundColor: controller.returnColor(),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: controller.d),
                        width: (controller.isDarkMode ? 0 :  controller.w) + (controller.plusing + 3),
                        height: Get.height / controller.h + (controller.plusing + 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(controller.radius),
                            border: Border(
                                left: BorderSide(color: controller.whiteShadow),
                                top: BorderSide(color: controller.whiteShadow),
                                right: BorderSide(color: controller.whiteShadow,width: 0),
                                bottom: BorderSide(color: controller.whiteShadow)
                            )
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: controller.d),
                        width: controller.w,
                        height: Get.height / controller.h,
                        decoration: BoxDecoration(
                          color: controller.returnBottomSwitch(),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(controller.radius),
                              bottomLeft: Radius.circular(controller.radius)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /// for black border
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: controller.d),
                    width: controller.w + 2,
                    height: Get.height / (controller.h / 2) + (controller.plusing + 2),
                    decoration: BoxDecoration(
                        color: controller.isDarkMode ? Colors.deepOrange :  controller.whiteShadow,
                        borderRadius: BorderRadius.circular(controller.radius),
                        border: Border.all(color: controller.isDarkMode ? Colors.deepOrange :  controller.returnBorder(),width: 3)
                    ),
                  ),
                ),
              ),
              /// for left shadow
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100,right: 45),
                    child: Transform.rotate(
                      angle: 0.2,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: controller.d),
                        width: controller.w / 2,
                        height: (Get.height / controller.h) - 0,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(-5.0,5.0),
                                  spreadRadius: 1.0,
                                  blurRadius: 10.0,
                                  color: controller.isDarkMode ? Colors.transparent : Colors.black87
                              )
                            ],
                            borderRadius: BorderRadius.circular(40)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              /// for top shadow
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(bottom: 130),
                    duration: Duration(milliseconds: controller.d),
                    width: controller.w - (controller.isDarkMode ? 2 : 0),
                    height: Get.height / controller.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: controller.isDarkMode ? [
                          const BoxShadow(
                            color: Colors.deepOrange, // Shadow color
                            blurRadius: 10, // Spread of the shadow
                            offset: Offset(-5, 0), // Offset for left shadow
                          ),
                          const BoxShadow(
                            color: Colors.deepOrange, // Shadow color
                            blurRadius: 10, // Spread of the shadow
                            offset: Offset(5, 0), // Offset for right shadow
                          ),
                          const BoxShadow(
                            color: Colors.deepOrange, // Shadow color
                            blurRadius: 80,
                            spreadRadius: 10,// Spread of the shadow
                            offset: Offset(0, -5), // Offset for top shadow
                          ),
                        ] : [],
                        borderRadius: BorderRadius.circular(40)
                    ),
                  ),
                ),
              ),
              /// for bottom orange
              Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: AnimatedPadding(
                    duration: Duration(milliseconds: controller.d),
                    padding: EdgeInsets.only(top: controller.isDarkMode ? 0 : 130,left: controller.isDarkMode ? 0 : 5),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: controller.d),
                      width: controller.w - (controller.isDarkMode ? 0 : 7),
                      height: controller.isDarkMode ? ((Get.height / (controller.h)) * 2) : (Get.height / (controller.h) + (controller.plusing + 2)),
                      decoration: BoxDecoration(
                          color: controller.isDarkMode ? Colors.deepOrange : controller.whiteShadow,
                          borderRadius: BorderRadius.circular(controller.radius),
                          boxShadow: controller.isDarkMode == false  ? [
                            BoxShadow(
                                offset: const Offset(3.0,3.0),
                                blurRadius: 5.0,
                                spreadRadius: 1,
                                color: Colors.deepOrangeAccent.withOpacity(0.5)
                            ),
                          ] : [
                            BoxShadow(
                                offset: const Offset(3.0,-3.0),
                                blurRadius: 15.0,
                                spreadRadius: 1,
                                color: Colors.deepOrangeAccent.withOpacity(0.5)
                            ),
                            BoxShadow(
                                offset: const Offset(-3.0,3.0),
                                blurRadius: 15.0,
                                spreadRadius: 1,
                                color: Colors.deepOrangeAccent.withOpacity(0.5)
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.toLight();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: controller.d),
                          width: controller.w - (controller.isDarkMode ? 2 : 0),
                          height: Get.height / controller.h,
                          decoration: BoxDecoration(
                            color: controller.returnTopSwitch(),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(controller.radius),
                                topLeft: Radius.circular(controller.radius)
                            ),
                          ),
                          child: AnimatedPadding(
                            duration: Duration(milliseconds: controller.d),
                            padding: EdgeInsets.only(right: controller.isDarkMode ? 1 : 0,top: controller.isDarkMode ? 1 : 0,left: controller.isDarkMode ? 1 : 0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: controller.d),
                              width: controller.w,
                              height: Get.height / controller.h,
                              decoration: BoxDecoration(
                                color: controller.returnTopSwitch(),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(controller.radius),
                                    topLeft: Radius.circular(controller.radius)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.toDark();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: controller.d),
                          width: controller.w,
                          height: Get.height / controller.h,
                          decoration: BoxDecoration(
                            color: controller.isDarkMode ? Colors.deepOrangeAccent : controller.whiteShadow,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(controller.radius),
                                bottomLeft: Radius.circular(controller.radius)
                            ),
                          ),
                          child: AnimatedPadding(
                            duration: Duration(milliseconds: controller.d),
                            padding: EdgeInsets.only(right: 1,bottom: 1,left: controller.isDarkMode ? 1 : 0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: controller.d),
                              width: controller.w,
                              height: Get.height / controller.h,
                              decoration: BoxDecoration(
                                color: controller.returnBottomSwitch(),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(controller.radius),
                                    bottomLeft: Radius.circular(controller.radius)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


