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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
        leading: const Icon(Icons.person)
      ),
      body:
      ListView.separated(
        itemCount: 10,
          itemBuilder: (context,index){
            return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('List $index'),
                            LoginButton(
                              buttonName: 'Login',
                              isLogin: true,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LifecycleExampleScreen()));
                              },
                            ),
                      ],
                    ),
                  ),
                );
          },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: CustomeColors.redColor,
            height: 3,
          );

        },)
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
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //      const Text("Body"),
      //      const Text("Body"),
      //      const Text("Body"),
      //      const Text("Body"),
      //       ElevatedButton(onPressed: (){
      //         print("DEFAULT BUTTON");
      //       }, child: const Text("Default Button")),
      //
      //       //button name: "SEARCH"
      //     LoginButton(
      //       buttonName: 'Login',
      //       isLogin: true,
      //       onTap: () {  },
      //     ),
      //     Form(
      //         child:
      //         TextFormField(
      //           initialValue: 'Start',
      //           decoration: InputDecoration(
      //             labelText: 'Label Text',
      //             helperText: "Helper text",
      //             hintText: 'Hint text',
      //             errorText: 'Error text',
      //             icon: Icon(Icons.person),
      //             prefix: null,
      //             prefixIcon: Icon(Icons.person),
      //             suffix: null,
      //             suffixIcon: Icon(Icons.person)
      //           ),
      //           maxLength: 10,
      //           maxLines: 1,
      //           keyboardType: TextInputType.number,
      //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      //         )
      //     ),
      //     const SizedBox(height: 20,),
      //     const Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //          Text("Body1"),
      //          Text("Body2"),
      //
      //       ],
      //     ),
      //     ///Image widget with asset & network call
      //     /// Expanded : will divide height in same portaions
      //     Expanded(
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: [
      //             Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
      //             Image.asset("assets/images/test.png"),
      //
      //           ],
      //         ),
      //       ),
      //     ),
      //     /// Flexible: we can use portions in 1:2 | 2:2 kind of space
      //     Flexible(
      //       flex: 2,
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: [
      //             Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
      //             Image.asset("assets/images/test.png"),
      //
      //           ],
      //         ),
      //       ),
      //     ),
      //     Flexible(
      //       flex: 1,
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: [
      //             Image.network("https://docs.flutter.dev/assets/images/dash/Dash.png"),
      //             Image.asset("assets/images/test.png"),
      //
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
