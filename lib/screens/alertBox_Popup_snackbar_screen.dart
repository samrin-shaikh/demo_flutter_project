import 'package:flutter/material.dart';

import '../widgets/customSnackbar.dart';
class AlertPopUpSnackBarScreen extends StatefulWidget {
  const AlertPopUpSnackBarScreen({super.key});

  @override
  State<AlertPopUpSnackBarScreen> createState() => _AlertPopUpSnackBarScreenState();
}

class _AlertPopUpSnackBarScreenState extends State<AlertPopUpSnackBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Feedback/Alert message/success/faliur msg"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: (){
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: const Text("MyAlert Box"),
                      content: const Text("sdhbf dsbcjkdsh jshdjkdh  jdjkdhfjkds"),
                      actions: [
                        TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"))
                      ],
                    ));
              },
              child: const Text("Alert Box")),
          ElevatedButton(
              onPressed: (){
                var snackbar = const SnackBar(
                    content: Text("this is my snackbar"),
                duration: Duration(seconds:10),);
                ScaffoldMessenger.of(context).showSnackBar(snackbar);

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("data"),
                  duration: Duration(seconds: 5),));

              },
              child: const Text("SnackBar")),
          ElevatedButton(
              onPressed: (){
                /// color
                /// text
                /// duration
                /// as widget
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: CustomSnackbar(
                    title: "Test custom snackbar",
                    subTitle: "subtitle",
                    icon: Icons.icecream,
                  ))
                );
              },
              child: const Text("Custome SnackBar")),
          ElevatedButton(
              onPressed: (){
                print("object");
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      // height: 200,
                      height: MediaQuery.of(context).size.height*.5,
                      child: const Center(child: Text("this is bottom sheet")),
                    ));
              },
              child: const Text("BottomSheet")),
          ElevatedButton(
              onPressed: (){
                print("object");
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*.8,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("data"),
                                    Image.asset("assets/images/test.png"),
                                  ],
                                ),
                              ),
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);

                              }, child: Text("Ok"))
                            ],
                          ),
                        ),
                      );
                });
              },
              child: const Text("Custom Popup/Dialog with showDialog")),
          ElevatedButton(
              onPressed: (){
                print("object");

                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, Animation<double> animation, Animation<double> animationSecond){
                      return Material(
                        type: MaterialType.transparency,
                        child: SafeArea(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                  begin: Offset(0, -1),
                                  end: Offset.zero
                              ).animate(animation),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.4,
                                decoration:const BoxDecoration(
                                    color: Colors.white
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text("data"),
                                          Image.asset("assets/images/test.png"),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("Ok"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: const Text("Custom Popup/Dialog with showGeneralDialog with transition and animation"))

        ],
      ),
    );
  }
}
