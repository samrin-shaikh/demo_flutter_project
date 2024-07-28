import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifecycleExampleScreen extends StatefulWidget {
  const LifecycleExampleScreen({super.key});

  @override
  State<LifecycleExampleScreen> createState() => _LifecycleExampleScreenState();
}

class _LifecycleExampleScreenState extends State<LifecycleExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful App lifecycle"),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
    );
  }
}
