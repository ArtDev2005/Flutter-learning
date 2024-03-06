import 'package:flutter/material.dart';

final key = GlobalKey<_AwesomeTextState>();

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => key.currentState?._increment(),
                child: Text("Inc"),
              ),
              AwesomeText(
                key: key,
              )
            ],
          ),
        ),
      ),
    );
  }
}


class AwesomeText extends StatefulWidget {
  const AwesomeText({super.key});

  @override
  State<AwesomeText> createState() => _AwesomeTextState();
}

class _AwesomeTextState extends State<AwesomeText> {
  var _value = 0;
  void _increment(){
    _value++;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$_value"
      ),
    );
  }
}
