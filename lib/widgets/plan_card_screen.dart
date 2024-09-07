import 'package:demoproject/widgets/rounded_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class PlanCard extends StatefulWidget {
  final String? cardTitle;
  final String? title;
  final String? date;
  final String? time;
  final String? roomNo;
  final Color backColor;
  final bool isTrainer;
  final double? width;
  final bool isSicalIcons;

  PlanCard({super.key,
  required this.cardTitle,
     this.time,
     this.date,
     this.roomNo,
     this.title,
    this.backColor = Colors.white,
    this.isTrainer = false,
     this.width,
    this.isSicalIcons =false,
  });


  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
        color: widget.backColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: widget.isSicalIcons? const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedImage(width: 40,),
            RoundedImage(width: 40,),
            RoundedImage(width: 40,),
          ],
        ):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)

              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(widget.cardTitle!,
                  style:TextStyle(
                      fontSize: 10,
                  ),),
              ),
            ),
            const SizedBox(height: 20,),
            Text(widget.title!,
              style:TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),),
            const SizedBox(height: 8,),
            Text(widget.date!,
              style:TextStyle(
                fontSize: 12,
              ),),
            Text(widget.title!,
              style:TextStyle(
                fontSize: 12,
              ),),
            Text(widget.roomNo!,
              style:TextStyle(
                fontSize: 12,
              ),),
            const SizedBox(height: 20,),
            widget.isTrainer?Row(
              children: [
                RoundedImage(),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Trainer",
                      style:TextStyle(
                        fontSize: 10,
                      ),),
                    Text("Samarin shaikh",
                      style:TextStyle(
                        fontSize: 12,
                      ),),
                  ],
                )
              ],
            ):const SizedBox()
          ],
        ),
      ),
    );
  }
}
