import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learning/domain/api_clients/api_clients.dart';
import 'package:flutter_learning/example_model.dart';
import 'package:json_annotation/json_annotation.dart';

void main(){
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    ApiClient().getPosts();
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ExampleModelProvider(
            model: model,
            child: Column(
              children: [
                ElevatedButton(
                  child: Text("Update posts"),
                  onPressed: () => model.reloadPosts(),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  child: Text("Create posts"),
                  onPressed: () => model.createPosts(),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}


