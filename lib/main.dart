import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'addresses.dart';

part 'main.g.dart';

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

List<Human> humans = [
  Human(
    name: "Artem",
    surname: "Petrov",
    age: 18,
    addresses: [
      Address(city: "Moscow", street: "Bauman", house: "12a", flat: 8),
      Address(city: "Cherepovez", street: "Pushkin", house: "49", flat: 20),
      Address(city: "Moscow", street: "Gogol", house: "8", flat: 1),
    ]
  ),
  Human(
      name: "Victor",
      surname: "Ivanov",
      age: 18,
      addresses: [
        Address(city: "Moscow", street: "Bauman", house: "12a", flat: 8),
        Address(city: "Cherepovez", street: "Pushkin", house: "49", flat: 20),
        Address(city: "Moscow", street: "Gogol", house: "8", flat: 1),
      ]
  )
];

@JsonSerializable()
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

  factory Human.fromJson(Map<String, dynamic> json) => _$HumanFromJson(json);
  Map<String, dynamic> toJson() => _$HumanToJson(this);

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("Decode"),
                  onPressed: (){
                    try{
                      final json = jsonDecode(jsonString) as List<dynamic>;
                      final humans = json.map((dynamic e) => Human.fromJson(e as Map<String, dynamic>)).toList();
                      print(humans);
                    }
                    catch (error){
                      print(error);
                    }
                  },
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  child: Text("Encode"),
                  onPressed: (){
                    try{
                      final objs = humans.map((e) => e.toJson()).toList();
                      final jsonString = jsonEncode(objs);
                      print(jsonString);
                    }
                    catch (error){
                      print(error);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


