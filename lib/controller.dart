import 'package:flutter/material.dart';
import 'package:get/get.dart';

class getController extends GetxController {



  bool isDarkMode = true;
  Color whiteShadow = const Color(0xffd6d8d6);

  Color backGroundColor = const Color(0xff8f9191);

  toDark(){
    isDarkMode = true;
    Get.changeTheme(ThemeData.dark());
    update();
  }

  toLight(){
    isDarkMode = false;
    Get.changeTheme(ThemeData.light());
    update();
  }


   returnColor(){
     if(isDarkMode){
       return const Color(0xff202221);
     }else{
       return const Color(0xff9ea09f);
     }
   }

  returnBorder(){
    if(isDarkMode){
      return Colors.black;
    }else{
      return Colors.black;
    }
  }




  returnTopSwitch(){
     if(isDarkMode){
       return const Color(0xff262827);
     }else{
       return const Color(0xff9d9f9e);
     }
  }
  returnBottomSwitch(){
    if(isDarkMode){
      return const Color(0xff202221);
    }else{
      return const Color(0xff8f9191);
    }
  }





  double h = 6.8;
  double w = 100;
  double plusing = 1;
  double radius = 40;
  var d = 250;
}
