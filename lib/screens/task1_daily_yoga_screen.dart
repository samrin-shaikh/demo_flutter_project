import 'package:demoproject/widgets/rounded_image_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/plan_card_screen.dart';


class DailyYogaScreen extends StatefulWidget {
  const DailyYogaScreen({super.key});

  @override
  State<DailyYogaScreen> createState() => _DailyYogaScreenState();
}

class _DailyYogaScreenState extends State<DailyYogaScreen> {
  int selectedIndex = 0;
  int bottomBarCurrentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static List<Widget> _pages = <Widget>[
    Center(child: Text("Tab Home")),
    Center(child: Text("Tab Cart")),
    Center(child: Text("Tab Settings"))
  ];

  void _onBottomBarTap(int index){
    print("Printing tap initial $bottomBarCurrentIndex");

    setState(() {
      bottomBarCurrentIndex  = index;
      print("Printing tap $index");
      print("Printing tap 1 $bottomBarCurrentIndex");

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaffoldKey.currentState?.openDrawer();
    setState(() {
      bottomBarCurrentIndex  = 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back)),
        // GestureDetector(
        //   onTap: (){
        //     _scaffoldKey.currentState?.openDrawer();
        //
        //   },
        //     child: RoundedImage()),
        title: _appBArTitle(),
        actions: [
          _actionItemAppBar()
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.orangeAccent,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit_outlined,),
              label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Setting"),
            ],
          currentIndex: bottomBarCurrentIndex,
          onTap: _onBottomBarTap
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            // DrawerHeader(
            //     child: Text("Drawer Header")),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("Address"),
              leading: Icon(Icons.location_city),
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            )
          ],
        ),
      ),
      drawerEnableOpenDragGesture: true,
      body: bottomBarCurrentIndex == 0
          ?_homeBuild():
      bottomBarCurrentIndex == 1
          ?_cartBuild(): _settingsBuild(), //_pages[2]

    );
  }

  Widget _homeBuild(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDailyChallenge(),
          const SizedBox(height: 15,),
          _buildCalender(),
          const SizedBox(height: 15,),
          _buildYourPlan()
        ],
      ),
    );
  }

  Widget _cartBuild(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildYourPlan()
        ],
      ),
    );
  }
  Widget _settingsBuild(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCalender(),
          const SizedBox(height: 15,),
          _buildYourPlan()
        ],
      ),
    );
  }
  Widget _actionItemAppBar(){
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: Colors.grey
          )
        ),
        child: Icon(Icons.search),
      ),
    );
  }
  // Widget _roundedImage(){
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 10),
  //     child: Container(
  //       width: 50,
  //       height: 50,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         border: Border.all(
  //           width: 2,
  //           color: Colors.red
  //         )
  //       ),
  //       child: ClipOval(
  //         child: Image.network(
  //             "https://docs.flutter.dev/assets/images/dash/Dash.png",
  //         fit: BoxFit.contain,
  //         width: 50,
  //         height: 50),
  //       ),
  //     ),
  //   );
  // }
  Widget _appBArTitle(){
    return const Column(
      children: [
        Text("Hello World",
          style:TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700
          ),),
        Text("Today 1 Sept",
          style:TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300
          ),)
      ],
    );
  }
  Widget _buildDailyChallenge(){
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple[200],
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ///First part
                Expanded(
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Daily Challenge",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),),
                        Text("Do your plan before 9:00",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12
                          ),),
                        const SizedBox(height: 10,),
                        _buildRoundedProfile(),

                      ],
                    ),),
              ],
            ),
          ),
        ),
        Positioned(
          right: -5,
            top: -10,
            child: Image.asset("assets/images/logo.png",
              width: 100, height: 100,))


      ],
    );
  }
  Widget  _buildRoundedProfile(){
    return SizedBox(
      width: 150,
      height: 50,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // for(int i = 0; i<3 ;i++)
          //   Positioned(
          //     left: i * 30,
          //       top: 0,
          //       child: _roundedImage()),
          // Positioned(
          //   left: 3 * 30,
          //     child: Container(
          //       width: 50,
          //       height: 50,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         shape: BoxShape.circle,
          //         border: Border.all(color: Colors.red)
          //       ),
          //       child: Center(child: Text("+4")),
          //     ))
          Positioned(
              left: 80,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red)
                ),
                child: Center(child: Text("+4")),
              )),
          const Positioned(
              left: 45,
              bottom: 0,
              child: RoundedImage()),
          const Positioned(
              left: 30,
              bottom: 0,
              child: RoundedImage()),
          const Positioned(
              left: 10,
              bottom: 0,
              child: RoundedImage()),
        ],
      ),
    );
  }
  Widget _buildCalender(){
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          bool isSelected = index  == selectedIndex;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              print("Printing $index");
              setState(() {
                selectedIndex = index;
              });
              print("Printing  selected $selectedIndex");

            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                color: isSelected ?  Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.grey,
                  width: 1
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(['Sun' , 'Mon' , 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index],
                      style: TextStyle(fontSize: 12, color: isSelected ?  Colors.white : Colors.black),),
                    Text("${22 +index}",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: isSelected ?  Colors.white : Colors.black),),
                  ],
                ),
              ),
            ),
          ),
        );
    },
    ),
    );
  }
  Widget _buildYourPlan(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Plan",
          style:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PlanCard(
                cardTitle: "Medium",
                title: "Yoga Group",
                date: "25 Nov",
                time: "3:05 PM",
                roomNo: "A5 room",
                backColor: Colors.orangeAccent,
                isTrainer: true,
                // width: 200,
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PlanCard(
                      cardTitle: "Light",
                      title: "Balance",
                      date: "29 Nov",
                      time: "5:00 PM",
                      roomNo: "A2 room",
                      backColor: Colors.blue[100]!,
                      // isTrainer: true,
                      // width: 200,

                    ),
                    const SizedBox(height: 10,),
                    PlanCard(
                     isSicalIcons: true, cardTitle: '',
                      backColor: Colors.purpleAccent[100]!,
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }

}
