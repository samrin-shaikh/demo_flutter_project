import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';
class LoaderBarExample extends StatefulWidget {
  const LoaderBarExample({super.key});

  @override
  State<LoaderBarExample> createState() => _LoaderBarExampleState();
}

class _LoaderBarExampleState extends State<LoaderBarExample> {
  bool _isLoading =  false;
  double progressValue = 0.0;

  Future<void> _startLoading() async {
    setState(() {
      _isLoading = true;
      progressValue = 0.0;
    });

    for(int i=0; i<5; i++){
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        progressValue += 0.2;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Loader Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        },
        onSearchPressed: () {
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(_isLoading)...[
            const SizedBox(height: 30,),
            const CircularProgressIndicator(),
            const SizedBox(height: 30,),
            const Text("checking loader"),
            LinearProgressIndicator(value:progressValue,),
          ]else
            const Text("Loader start"),
          ElevatedButton(onPressed: _isLoading?null:_startLoading, child: const Text("Start Loader")),
          const SizedBox(height: 30,),
          CachedNetworkImage(
            imageUrl: "https://docs.flutter.dev/assets/images/dash/Dash.png",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
      // Image.network("https://cdn.pixabay.com/photo/2024/09/30/10/43/flowers-9085492_1280.jpg"),
    );
  }
}
