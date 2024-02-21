import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'app.dart';


void main(){
  runApp(Example());
}


class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.snowboarding_outlined),
                //labelText: "text",
                helperText: "helper",
                hintText: "enter",
                //errorText: "error",
                prefixIcon: Icon(Icons.alarm),
                prefix: Text("prefix"),
                suffix: Text("suffix"),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
