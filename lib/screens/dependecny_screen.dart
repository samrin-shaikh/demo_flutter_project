
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../core/route_generator.dart';
import '../widgets/appbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DependecnyScreen extends StatefulWidget {
  const DependecnyScreen({super.key});

  @override
  State<DependecnyScreen> createState() => _DependecnyScreenState();
}

class _DependecnyScreenState extends State<DependecnyScreen> {

  SharedPreferences? preferences;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchSharedPrefValues();
    ///getting shared pref values
  }
  Future<void> _fetchSharedPrefValues() async {
    preferences = await SharedPreferences.getInstance();
    ///get token values
    String? userToken = preferences?.getString("user_token");
    print("shared Pref in depen screen: $userToken");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Dependency Example',
        onMenuPressed: () {
          Navigator.pushNamed(context, RouteGeneratorsNames.topicScreen);
        },
        onSearchPressed: () {
        },
      ),
      body: Column(
        children: [
          const Text("OTP Verification"),
          const SizedBox(height: 20,),
          OtpTextField(
            numberOfFields: 4,
            fieldWidth: 60,
            fieldHeight: 100,
            borderColor: Color(0xFFb95742),
            focusedBorderColor: Color(0xFFb95742),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              print("onchnage: $code");
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              print("onSubmit: $verificationCode");
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            }, // end onSubmit
          ),
          ElevatedButton(onPressed: (){}, child: const Text("Verify OTP"))
        ],
      ),
    );
  }
}
