import 'package:demoproject/core/route_generator.dart';
import 'package:demoproject/popups/nitification_service.dart';
import 'package:demoproject/screens/home_screen.dart';
import 'package:demoproject/screens/topics_screen.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initNotification();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute, //to initalize route generator
      initialRoute: RouteGeneratorsNames.topicScreen, // to set intial screen -> what to show at first time
      title: 'Demo',
      home:  TopicScreen(),
    );
  }
}