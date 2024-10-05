import 'package:flutter/material.dart';
class AdpativeResponsiveScreen extends StatefulWidget {
  const AdpativeResponsiveScreen({super.key});

  @override
  State<AdpativeResponsiveScreen> createState() => _AdpativeResponsiveScreenState();
}

class _AdpativeResponsiveScreenState extends State<AdpativeResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AR Screen demo"),
      ),
      body:
      Container(
        width: 200,
        child: LayoutBuilder(
            builder: (context, constraints){
              /// max height, max width, min height, min width
              if(constraints.maxWidth >300) {
                ///to wide phone view
                return const MediaQueryExample();
              }if(constraints.maxWidth >600){
                ///to wide tablet/ipad view
                return const TabletIpadLayout();

              }else{
                ///to laptop/desktop layout view
                return const LaptopDesktopLayout();
              }
            }
        ),
      )
    );
  }

}

class PhoneLayout extends StatelessWidget {
  const PhoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // 400
    // 300
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context, index) => ListTile(title: Text("Index $index"),)
    );
  }
}

class TabletIpadLayout extends StatelessWidget {
  const TabletIpadLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(title: Text("Index $index"),)
          ),
        ),
        const Expanded(
            child: Center(
                child: Text("Tablet Ipad view Checking flex 2")))
      ],
    );
  }
}
class LaptopDesktopLayout extends StatelessWidget {
  const LaptopDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(title: Text("Index $index"),)
          ),
        ),
        const Expanded(
            child: Center(
                child: Text("Laptop Desktop view flex 2")))
      ],
    );

  }
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    double screenWidthPortion = mediaQuery.size.width * 0.3;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Query Example"),
      ),
      body:  Container(
        width: 200,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Screen Width: ${screenWidth.toStringAsFixed(2)}"),
                Text("Screen Height: ${screenHeight.toStringAsFixed(2)}"),
                Text("Screen Width portion : ${screenWidthPortion.toStringAsFixed(2)}"),

                screenWidth == 393 ?
                _buildPhoneLayout()
                    :screenWidth > 600?
                _buildTabletIpadLayout():
                _buildDesktopLayout(),

                const SizedBox(height: 20,),

                Container(
                  width: mediaQuery.size.width * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.orangeAccent
                  ),
                  child: const Text("checking media query with container"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildPhoneLayout(){
    return const Text("Phone Layout", style: TextStyle(fontSize: 16),);
  }
  Widget _buildTabletIpadLayout(){
    return const Text("Tablet Ipad Layout", style: TextStyle(fontSize: 25),);

  }
  Widget _buildDesktopLayout(){
    return const Text("Desktop Layout", style: TextStyle(fontSize: 30),);

  }
}



