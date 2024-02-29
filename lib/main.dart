import 'dart:math';

import 'package:flutter/material.dart';

import 'app.dart';


void main(){
  runApp(Example());
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  double percent = 0.30;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: RadialPercentWidget(
                child: Text(
                  "${(percent * 100).toInt()}%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                  ),
                percent: percent,
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: (){
                if (percent < 1.0){
                  setState(() {
                    percent += 0.01;
                  });
                }
              },
              child: Text(
                "Increment"
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.red),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: (){
                if (percent > 0.01){
                  setState(() {
                    percent -= 0.01;
                    percent.round();
                    print(percent);
                  });
                }
              },
              child: Text(
                  "Decrement"
              ),
            )
          ],
        ),
      ),

    );
  }
}


class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  const RadialPercentWidget({super.key, required this.child, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(percent: percent),
        ),
        Center(child: child),
      ],
    );
  }
}



class MyPainter extends CustomPainter{
  final double strokeWidth = 8;
  final double percent;

  MyPainter({super.repaint, required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgPaint = Paint(); // styles
    bgPaint.color = Colors.black;
    bgPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, bgPaint);

    Paint filledPaint = Paint(); // styles
    filledPaint.color = Colors.red;
    filledPaint.style = PaintingStyle.stroke;
    filledPaint.strokeWidth = strokeWidth;
    canvas.drawArc(Offset(
        strokeWidth / 2 + 3, strokeWidth / 2 + 3) & Size(size.width - strokeWidth - 6,
        size.height - strokeWidth - 6),
        pi * 2 * percent - (pi / 2),
        pi * 2 * (1 - percent), false, filledPaint
    );
    Paint fillPaint = Paint(); // styles
    fillPaint.color = Colors.green;
    fillPaint.style = PaintingStyle.stroke;
    fillPaint.strokeWidth = strokeWidth;
    fillPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(Offset(
        strokeWidth / 2 + 3, strokeWidth / 2 + 3) & Size(size.width - strokeWidth - 6,
        size.height - strokeWidth - 6), -pi / 2, pi * 2 * percent, false, fillPaint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}