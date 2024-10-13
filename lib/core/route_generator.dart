import 'package:demoproject/screens/date_time_picker_screen.dart';
import 'package:demoproject/screens/dependecny_screen.dart';
import 'package:demoproject/screens/image_assets_screen.dart';
import 'package:demoproject/screens/loaderscreen.dart';
import 'package:demoproject/screens/login.dart';
import 'package:demoproject/screens/rest_api_call_screen.dart';
import 'package:demoproject/screens/topics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/adapative_responsive_screen.dart';
import '../screens/alertBox_Popup_snackbar_screen.dart';
import '../screens/home_screen.dart';
import '../screens/interactivity_input_widgets_screen.dart';
import '../screens/lifecycle_example_screen.dart';
import '../screens/task1_daily_yoga_screen.dart';
import '../screens/widgets_demo_screen.dart';
import '../screens/widgte_expanded_flexible_screen.dart';

class RouteGeneratorsNames{

  //route name //named parameter
  static const String dailyYogaScreen = "/dailyYoga";
  static const String homeScreen = "/home";
  static const String topicScreen = "/topics";
  static const String customButtonScreen = "/customButtonScreen";
  static const String dailyYogaScreen2 = "/dailyYoga2";
  static const String dailyYogaScreen3 = "/dailyYoga3";
  static const String dailyYogaScreen4 = "/dailyYoga4";
  static const String adpativeResponsiveScreen = "/adpativeResponsiveScreen";
  static const String alertPopUpSnackBarScreen = "/alertPopUpSnackBarScreen";
  static const String widgetDemoScreen = "/widgetDemoScreen";
  static const String widgetDemoExpandedFlexibleScreen = "/widgetDemoExpandedFlexibleScreen";
  static const String assetsImageScreen = "/assetsImageScreen";
  static const String interactivityInputWidgetsScreen = "/interactivityInputWidgetsScreen";

  static const String appLifeCycleScreen = "/appLifeCycleScreen";
  static const String loaderBarExampleScreen = "/loaderBarExampleScreen";
  static const String dependecyExample = "/dependecyExample";
  static const String dateTimePickerScreen = "/dateTimePickerScreen";
  static const String restApiCallScreen = "/restApiCallScreen";



}

class RouteGenerator{
  // to generate route
  static Route<dynamic> generateRoute (RouteSettings setting){
    final args = setting.arguments;

    switch(setting.name){
      case RouteGeneratorsNames.topicScreen:
        return MaterialPageRoute(builder: (_) =>  const TopicScreen());

      case RouteGeneratorsNames.homeScreen:
        return MaterialPageRoute(builder: (_) =>  const ListViewNavigationDrawerScreen());

      case RouteGeneratorsNames.widgetDemoScreen:
        return MaterialPageRoute(builder: (_) => const WidgetDemoStateful());

      case RouteGeneratorsNames.widgetDemoExpandedFlexibleScreen:
        return MaterialPageRoute(builder: (_) => const WidegtDemoExpandedFlexibleScreen());

      case RouteGeneratorsNames.assetsImageScreen:
        return MaterialPageRoute(builder: (_) => const ImageAssetsScreen());

      case RouteGeneratorsNames.interactivityInputWidgetsScreen:
        return MaterialPageRoute(builder: (_) => const InteractivityInputWidgetsScreen());

      case RouteGeneratorsNames.customButtonScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteGeneratorsNames.dailyYogaScreen:
        return MaterialPageRoute(builder: (_) => const DailyYogaScreen());

      case RouteGeneratorsNames.adpativeResponsiveScreen:
        return MaterialPageRoute(builder: (_) => const AdpativeResponsiveScreen());

      case RouteGeneratorsNames.alertPopUpSnackBarScreen:
        return MaterialPageRoute(builder: (_) => const AlertPopUpSnackBarScreen());

      case RouteGeneratorsNames.appLifeCycleScreen:
        return MaterialPageRoute(builder: (_) => LifecycleExampleScreen());

      case RouteGeneratorsNames.loaderBarExampleScreen:
        return MaterialPageRoute(builder: (_) => const LoaderBarExample());

      case RouteGeneratorsNames.dependecyExample:
        return MaterialPageRoute(builder: (_) => const DependecnyScreen());

      case RouteGeneratorsNames.dateTimePickerScreen:
        return MaterialPageRoute(builder: (_) => const DateTimePickerScreen());

      case RouteGeneratorsNames.restApiCallScreen:
        return MaterialPageRoute(builder: (_) => const RestApiCallScreen());

      case RouteGeneratorsNames.dateTimePickerScreen:
        if(args is String){
          return MaterialPageRoute(builder: (_) => const DateTimePickerScreen());
        }

        return errorRoute();
        //if no name found

      default:
          return MaterialPageRoute(builder: (_) =>  const TopicScreen());

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