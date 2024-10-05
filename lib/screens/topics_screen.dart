import 'package:flutter/material.dart';

import '../core/route_generator.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildButton(
              context,
              'Simple widgets (Button, text, row, column, container etc)',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.widgetDemoScreen),
            ),
            _buildButton(
              context,
              'Simple widgets (Form, textFiled, textFormFiled, and properties)',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.interactivityInputWidgetsScreen),
            ),
            _buildButton(
              context,
              'How to add images (Network image, Asset image)',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.assetsImageScreen),
            ),
            _buildButton(
              context,
              'How to make screen scrollable, Divide screen in portions (SingleChildScrollView, Expanded, Flexible)',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.widgetDemoExpandedFlexibleScreen),
            ),
            _buildButton(
              context,
              'ListView, List tile,Navigation Drawer',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.homeScreen),
            ),
            _buildButton(
              context,
              'Custom buttons, widgets, shape with container',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.customButtonScreen),
            ),
            _buildButton(
              context,
              'Theme (Text theme, color theme, font theme)',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.dailyYogaScreen),
            ),
            _buildButton(
              context,
              'Assignment 1 ( UI design) ',
                  () =>
                  Navigator.pushNamed(context, RouteGeneratorsNames.dailyYogaScreen),
            ),
            _buildButton(
              context,
              'Bottom Navigation Bar',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.dailyYogaScreen),
            ),

            _buildButton(
              context,
              'Route Manager',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen),
            ),
            _buildButton(
              context,
              'Adaptive & Responsive screen design',
                  () =>
                  Navigator.pushNamed(context, RouteGeneratorsNames.adpativeResponsiveScreen),
            ),
            _buildButton(
              context,
              'Alert, Dialog, Snack bar',
                  () =>
                  Navigator.pushNamed(context, RouteGeneratorsNames.alertPopUpSnackBarScreen),
            ),
            _buildButton(
              context,
              'App LifeCycle (stateful & stateless widget)',
                  () =>
                      Navigator.pushNamed(context, RouteGeneratorsNames.appLifeCycleScreen),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
