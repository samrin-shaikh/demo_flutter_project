import 'package:flutter/material.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';

/// Add images into asserts folder to use from project
/// add assets location of image into pubspec.yaml file
/// network image dont required to add into assets, directly using url we can show image
class ImageAssetsScreen extends StatefulWidget {
  const ImageAssetsScreen({super.key});

  @override
  State<ImageAssetsScreen> createState() => _ImageAssetsScreenState();
}

class _ImageAssetsScreenState extends State<ImageAssetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Image/Assets Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        },
        onSearchPressed: () {
        },
      ),
      body:  Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.red,
            ///BorderRadius.circular --> for all corners same radius
            /// BorderRadius.only --> for single side radius
            // borderRadius: BorderRadius.circular(10)
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(5))
        ),
        child:  SingleChildScrollView(
          child: Column(
            /// Vertical alignment for child widget --> mainAxisAlignment
            /// Horizontal alignment for child widget -->crossAxisAlignment
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
              Image.asset("assets/images/test.png"),

            ],
          ),
        ),
      ),
    );
  }
}
