import 'package:flutter/material.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';
class InteractivityInputWidgetsScreen extends StatefulWidget {
  const InteractivityInputWidgetsScreen({super.key});

  @override
  State<InteractivityInputWidgetsScreen> createState() => _InteractivityInputWidgetsScreenState();
}

class _InteractivityInputWidgetsScreenState extends State<InteractivityInputWidgetsScreen> {
  String? textValues = "First value";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Interactivity InputWidgets Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        },
        onSearchPressed: () {
        },
      ),
      body:  Container(
        width: double.infinity,
        child:  Column(
          /// Vertical alignment for child widget --> mainAxisAlignment
          /// Horizontal alignment for child widget -->crossAxisAlignment
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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

          ],
        ),
      ),
    );
  }
}
