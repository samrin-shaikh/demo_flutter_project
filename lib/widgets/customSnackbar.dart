import 'package:flutter/material.dart';
class CustomSnackbar extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  CustomSnackbar({super.key,
    required this.title,
    this.subTitle = '',
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13, color: Colors.red),),
              Text(subTitle, style: const TextStyle(fontSize: 10, color: Colors.white),),

            ],
          ),
        ),
        Positioned(
          bottom: 0,
            right: 0,
            child: Icon(icon, color: Colors.white,))
      ],
    );
  }
}
