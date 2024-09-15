import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/lifecycle_example_screen.dart';
import '../screens/task1_daily_yoga_screen.dart';

class RouteGeneratorsNames{

  //route name //named parameter
  static const String dailyYogaScreen = "/dailyYoga";
  static const String homeScreen = "/home";
  static const String dailyYogaScreen1 = "/dailyYoga1";
  static const String dailyYogaScreen2 = "/dailyYoga2";
  static const String dailyYogaScreen3 = "/dailyYoga3";
  static const String dailyYogaScreen4 = "/dailyYoga4";

}
class RouteGenerator{
  // to generate route
  static Route<dynamic> generateRoute (RouteSettings setting){
    final args = setting.arguments;

    switch(setting.name){
      case RouteGeneratorsNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteGeneratorsNames.dailyYogaScreen:
        return MaterialPageRoute(builder: (_) => const DailyYogaScreen());

      case RouteGeneratorsNames.dailyYogaScreen2:
        if(args is String){
          return MaterialPageRoute(builder: (_) => LifecycleExampleScreen(name: args));
        }

        return errorRoute();
        //if no name found

      default:
          return MaterialPageRoute(builder: (_) => const HomeScreen());

          //default page to show if no route found

    }
  }

  // to generate error route if no screen found or no name found
  static Route<dynamic> errorRoute (){
   return MaterialPageRoute(builder: (_){
     return Scaffold(
       appBar: AppBar(
         title: const Text("No route Found"),
       ),
       body: const Text("Error route Found"),
     );
   });
  }
}