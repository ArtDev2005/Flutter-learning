import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learning/global_key.dart';
import 'package:flutter_learning/unique_key.dart';

void main(){
  runApp(Example());
}

class Example extends StatelessWidget {
  final primaryColor = Color(0xFF151026);
  Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Inherit(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text("test",)
          ),
          body: SizedBox.expand(
            child: Container(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RedBox(),
                  SizedBox(height: 20,),
                  RedBox(),
                  SizedBox(height: 20,),
                  RedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class Inherit extends InheritedWidget {
  final Color color = Colors.indigo;
  final double fontSize = 26;
  final FontWeight fontWeight = FontWeight.w700;
  const Inherit({
    super.key,
    required Widget child,
  }) : super(child: child);

  static Inherit of(BuildContext context) {
    final Inherit? result = context.dependOnInheritedWidgetOfExactType<Inherit>();
    assert(result != null, 'No Inherit found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Inherit old) {
    return true;
  }
}


class RedBox extends StatelessWidget {
  const RedBox({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Inherit.of(context);
    return Container(
      color: store.color,
      width: 100,
      height: 100,
      child: FittedBox(
        child: Text(
          "sdfs",
          style: TextStyle(
            color: Colors.black,
            fontSize: store.fontSize,
            fontWeight: store.fontWeight,
          ),
        ),
      ),
    );
  }
}
