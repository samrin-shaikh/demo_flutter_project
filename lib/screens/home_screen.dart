import 'package:demoproject/core/constants.dart';
import 'package:demoproject/core/customeColors.dart';
import 'package:demoproject/screens/login.dart';
import 'package:demoproject/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lifecycle_example_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? textValues = "First value";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar Default size : 55
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sample app bar", style: TextStyle(fontSize: 25, color: Colors.deepPurple),),
        leading: const Icon(Icons.menu, size: 30, color: Colors.blue,),
        actions: const [
          Icon(Icons.more, color: Colors.red,)
        ],
      ),
      body:
          /// Column will be used for vertical align widgets
      Container(
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

      ///
      // Column(
      //   children: [
      //     ListView.separated(
      //       itemCount: 10,
      //         itemBuilder: (context,index){
      //           return Container(
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text('List $index'),
      //                           LoginButton(
      //                             buttonName: 'Login',
      //                             isLogin: true,
      //                             onTap: () {
      //                               Navigator.of(context).push(MaterialPageRoute(
      //                                   builder: (context) => const LifecycleExampleScreen()));
      //                             },
      //                           ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //         },
      //       separatorBuilder: (BuildContext context, int index) {
      //         return const Divider(
      //           color: CustomeColors.redColor,
      //           height: 3,
      //         );
      //
      //       },),
      //   ],
      // )
        // ListView.builder(
        // itemCount: 10,
        // itemBuilder: (context,index){
        //   return  Column(
        //     children: [
        //       Container(
        //         child: Text('List $index'),
        //       ),
        //       Divider(),
        //     ],
        //   );
        // })

    );
  }
}
