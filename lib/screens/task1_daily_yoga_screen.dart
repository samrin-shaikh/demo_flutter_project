import 'package:flutter/material.dart';


class DailyYogaScreen extends StatefulWidget {
  const DailyYogaScreen({super.key});

  @override
  State<DailyYogaScreen> createState() => _DailyYogaScreenState();
}

class _DailyYogaScreenState extends State<DailyYogaScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _roundedImage(),
        title: _appBArTitle(),
        actions: [
          _actionItemAppBar()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildDailyChallenge(),
            const SizedBox(height: 15,),
            _buildCalender(),
          ],
        ),
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
  Widget _roundedImage(){
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Colors.red
          )
        ),
        child: ClipOval(
          child: Image.network(
              "https://docs.flutter.dev/assets/images/dash/Dash.png",
          fit: BoxFit.contain,
          width: 50,
          height: 50),
        ),
      ),
    );
  }
  Widget _appBArTitle(){
    return Column(
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
    return Container(
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
                    Row(
                      children: [
                        _roundedImage(),
                        _roundedImage(),
                        _roundedImage(),
                      ],
                    )
                  ],
                ),),
            ///Second part
            Image.asset("assets/images/test.png", width: 60, height: 70,)
          ],
        ),
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
}
