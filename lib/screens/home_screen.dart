import 'package:demoproject/core/constants.dart';
import 'package:demoproject/core/customeColors.dart';
import 'package:demoproject/screens/login.dart';
import 'package:demoproject/screens/task1_daily_yoga_screen.dart';
import 'package:demoproject/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../core/route_generator.dart';
import 'lifecycle_example_screen.dart';

class ListViewNavigationDrawerScreen extends StatefulWidget {
  const ListViewNavigationDrawerScreen({super.key});

  @override
  State<ListViewNavigationDrawerScreen> createState() => _ListViewNavigationDrawerScreenState();
}

class _ListViewNavigationDrawerScreenState extends State<ListViewNavigationDrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar Default size : 55
      appBar: AppBar(
        centerTitle: true,
        title: const Text("List view, Drawer Example", style: TextStyle(fontSize: 25, color: Colors.deepPurple),),
        leading:  Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, size: 30, color: Colors.blue),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: const [
          Icon(Icons.more, color: Colors.red,)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
                child: Text("Drawer Header")),
            Text("Profile"),
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
                                    builder: (context) =>  LifecycleExampleScreen()));
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

    );
  }
}
