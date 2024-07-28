import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final String buttonName;
  final VoidCallback onTap;
  final IconData icon;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool isLogin;

  LoginButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
    this.icon = Icons.login,
    this.textStyle,
    this.backgroundColor,
    this.isLogin = false,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey,
          style: BorderStyle.solid,
          width: 4,
        ),
        // borderRadius: BorderRadius.circular(10)//for all corners
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(20)
        )//for specific corners

      ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isLogin?Icon(widget.icon):Icon(Icons.abc_rounded),
            const SizedBox(width: 8), // Add some spacing between the icon and text
            Text(
              widget.buttonName,
              style: widget.textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

