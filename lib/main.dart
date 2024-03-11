import 'dart:convert';

import 'package:flutter/material.dart';

import 'addresses.dart';

const jsonString = '''
  [
    {
      "name": "Иван",
      "surname": "Иванов",
      "age": 17,
      "addresses": 
      [
        {
          "city": "Москва",
          "street": "Баумана",
          "house": "12a",
          "flat": 12
        }
      ]
    }
  ]
''';

class Human{
  String name;
  String surname;
  int age;
  List<Address> addresses;

  Human({
    required this.name,
    required this.surname,
    required this.age,
    required this.addresses,
  });

  factory Human.fromJson(Map<String, dynamic> json){
    return Human(
      name: json["name"] as String,
      surname: json["surname"] as String,
      age: json["age"] as int,
      addresses: (json["addresses"] as List<dynamic>).map((dynamic e) => Address.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

void main(){
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: ElevatedButton(
              child: Text("Decode"),
              onPressed: (){
                final json = jsonDecode(jsonString) as List<dynamic>;
                final humans = json.map((dynamic e) => Human.fromJson(e as Map<String, dynamic>)).toList();
                print(humans[0].name);
              },
            ),
          ),
        ),
      ),
    );
  }
}


