import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/resources/resources.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'app.dart';


void main(){
  runApp(Example());
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Image(image: AssetImage(Images.chrome)),
        ],
      ),
    );
  }
}
