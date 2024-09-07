import 'package:flutter/material.dart';
class RoundedImage extends StatefulWidget {
  final double? width;
  const RoundedImage({super.key,
  this.width = 50});

  @override
  State<RoundedImage> createState() => _RoundedImageState();
}

class _RoundedImageState extends State<RoundedImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: widget.width,
        height: widget.width,
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
              width: widget.width,
              height: widget.width),
        ),
      ),
    );
  }
}
