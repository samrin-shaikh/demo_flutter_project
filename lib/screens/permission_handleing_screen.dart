import 'package:flutter/material.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';
class PermissionHandlingScreen extends StatefulWidget {
  const PermissionHandlingScreen({super.key});

  @override
  State<PermissionHandlingScreen> createState() => _PermissionHandlingScreenState();
}

class _PermissionHandlingScreenState extends State<PermissionHandlingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Location Permission Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        },
        onSearchPressed: () {},
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouteGeneratorsNames.cameraGalleryScreen);
          }, child: const Text('Camera & gallery')),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouteGeneratorsNames.locationScreen);
          }, child: const Text('Location')),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouteGeneratorsNames.phoneSmsScreen);
          }, child: const Text('Call/SMS/SHARE')),
        ],
      ),
    );
  }
}
