import 'package:flutter/material.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';


class WidegtDemoExpandedFlexibleScreen extends StatefulWidget {
  const WidegtDemoExpandedFlexibleScreen({super.key});

  @override
  State<WidegtDemoExpandedFlexibleScreen> createState() => _WidegtDemoExpandedFlexibleScreenState();
}

class _WidegtDemoExpandedFlexibleScreenState extends State<WidegtDemoExpandedFlexibleScreen> {
  String? textValues = "First value";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Widget Expanded/Flexible Example',
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
        child:  Column(
          /// Vertical alignment for child widget --> mainAxisAlignment
          /// Horizontal alignment for child widget -->crossAxisAlignment
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Expanded : will divide height in same portaions
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
                    Image.asset("assets/images/test.png"),

                  ],
                ),
              ),
            ),
            /// Flexible: we can use portions in 1:2 | 2:2 kind of space
            Flexible(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
                    Image.asset("assets/images/test.png"),

                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
                    Image.asset("assets/images/test.png"),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

