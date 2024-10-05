import 'package:flutter/material.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';


class WidgetDemoStateful extends StatefulWidget {
  const WidgetDemoStateful({super.key});

  @override
  State<WidgetDemoStateful> createState() => _WidgetDemoStatefulState();
}

class _WidgetDemoStatefulState extends State<WidgetDemoStateful> {
  String? textValues = "First value";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Widget Example',
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
              Text(textValues!),
              const Text("Body"),
              const Text("Body"),
              const Text("Body"),
              const Icon(Icons.icecream),
              ElevatedButton(
                  onPressed: (){
                    print("Prinitng elevated button");
                    textValues = "Second updated value";
                    print("Prinitng elevated button $textValues");

                    setState(() {
                      textValues = "Second updated value";
                    });

                  },
                  child: const Icon(Icons.search)),
              Row(
                /// Vertical alignment for child widget -->  crossAxisAlignment
                /// Horizontal alignment for child widget --> mainAxisAlignment
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(textValues!),
                  const Text("Body"),
                  const Text("Body"),
                  const Text("Body"),
                ],
              ),
              const SizedBox(
                  height: 30),
              Row(
                /// Vertical alignment for child widget -->  crossAxisAlignment
                /// Horizontal alignment for child widget --> mainAxisAlignment
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(textValues!),
                  const SizedBox(
                      width: 30),
                  const Text("Body"),
                  const SizedBox(
                      width: 30),
                  const Text("Body"),
                  const SizedBox(
                      width: 30),
                  const Text("Body"),
                ],
              ),
              const SizedBox(height: 20,),
              Form(
                child:
                Column(
                  children: [
                    TextFormField(
                      initialValue: 'Start',
                      decoration: const  InputDecoration(
                          labelText: 'Label Text',
                          helperText: "Helper text",
                          hintText: 'Hint text',
                          errorText: 'You can not type more than 10 char',
                          icon: Icon(Icons.abc_outlined),
                          prefix: null,
                          prefixIcon: Icon(Icons.person),
                          suffix: null,
                          suffixIcon: Icon(Icons.cancel),
                          border: OutlineInputBorder()
                      ),
                      maxLength: 100,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    TextFormField(
                      initialValue: 'Start',
                      decoration: const  InputDecoration(
                          labelText: 'Label Text',
                          helperText: "Helper text",
                          hintText: 'Hint text',
                          errorText: 'You can not type more than 10 char',
                          icon: Icon(Icons.abc_outlined),
                          prefix: null,
                          prefixIcon: Icon(Icons.person),
                          suffix: null,
                          suffixIcon: Icon(Icons.cancel),
                          border: OutlineInputBorder()
                      ),
                      maxLength: 100,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    TextFormField(
                      initialValue: 'Start',
                      decoration: const  InputDecoration(
                          labelText: 'Label Text',
                          helperText: "Helper text",
                          hintText: 'Hint text',
                          errorText: 'You can not type more than 10 char',
                          icon: Icon(Icons.abc_outlined),
                          prefix: null,
                          prefixIcon: Icon(Icons.person),
                          suffix: null,
                          suffixIcon: Icon(Icons.cancel),
                          border: OutlineInputBorder()
                      ),
                      maxLength: 100,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    ElevatedButton(
                        onPressed: (){
                          print("Prinitng elevated button");
                          textValues = "Second updated value";
                          print("Prinitng elevated button $textValues");
                          setState(() {
                            textValues = "Second updated value";
                          });

                          /// example of simple navigator
                          // stack
                          // home screen - > taks 1 screen -> task 2 -> task 1 - > task 3-> home screen -> button logout - >
                          // //
                          // Navigator.pop(context); uses : On back to previous screen
                          //Navigator.push uses: screen stack creation or add new screen to top of stack
                          //Navigator.pushReplacement uses: if wanted to remove stack old screen refence and add new screen to stack/ replace current route with new one
                          //Navigator.pushNamed  uses: with named parameter to screen name and navigate
                          // Navigator.pushNamedAndRemoveUntil : used : clear all previous stack of screen and add new screen feature like logout will work with this
                          // Navigator.push(
                          //     context, //object of this screen
                          // MaterialPageRoute(
                          //     builder: (context) => const DailyYogaScreen()));

                          // Navigator.pushReplacement(context,
                          // MaterialPageRoute(builder: (context) => DailyYogaScreen()));
                          // DailyYogaScreen : '/dailyYoga'
                          //
                          // Navigator.pushNamed(context, '/dailyYoga');
                          //
                          // Navigator.pushNamedAndRemoveUntil(context, '/dailyYoga', (Route<dynamic> route) => false);


                          /// Example of route manager

                          Navigator.pushNamed(context, RouteGeneratorsNames.dailyYogaScreen2, arguments: "gvgvghvgv");
                          // Navigator.pushNamed(context, RouteGeneratorsNames.dailyYogaScreen1);

                        },
                        child: const Text("Save")),

                  ],
                ),
              ),
              Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
              Image.asset("assets/images/test.png"),
              //   //button name: "SEARCH"
              // LoginButton(
              //   buttonName: 'Login',
              //   isLogin: true,
              //   onTap: () {  },
              // ),
              // const SizedBox(height: 20,),
              // ///Image widget with asset & network call
              // /// Expanded : will divide height in same portaions
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
              //         Image.asset("assets/images/test.png"),
              //
              //       ],
              //     ),
              //   ),
              // ),
              // /// Flexible: we can use portions in 1:2 | 2:2 kind of space
              // Flexible(
              //   flex: 2,
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
              //         Image.asset("assets/images/test.png"),
              //
              //       ],
              //     ),
              //   ),
              // ),
              // Flexible(
              //   flex: 1,
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
              //         Image.asset("assets/images/test.png"),
              //
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

