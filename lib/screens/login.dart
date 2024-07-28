import 'package:demoproject/widgets/login_button.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //button name: "LOGIN"
    return LoginButton(buttonName: 'Demo',
        onTap: (){});
  }
}
