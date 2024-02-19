import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(App());
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String text = "Ни одна кнопка не нажата";

  void printFirst(){
    setState(() {
      text = "Нажата первая кнопка";
    });
  }

  void printSecond(){
    setState(() {
      text = "Нажата вторая кнопка";
    });
  }

  void printThird(){
    setState(() {
      text = "Нажата третья кнопка";
    });
  }

  void printFourth(){
    setState(() {
      text = "Нажата четвертая кнопка";
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      //padding: MaterialStateProperty.all(EdgeInsets.all(0))
      //backgroundColor: MaterialStateProperty.all(Colors.red),
      //foregroundColor: MaterialStateProperty.all(Colors.white),
      //overlayColor: MaterialStateProperty.all(Colors.redAccent),
      //shadowColor: MaterialStateProperty.all(Colors.green),
      //elevation: MaterialStateProperty.all(10),
      //padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      //minimumSize: MaterialStateProperty.all(Size(100, 100)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(color: Colors.black)
        )
      ),
      //alignment: Alignment.topCenter,

    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text),
              ElevatedButton(
                onPressed: printFirst,
                style: style,
                clipBehavior: Clip.hardEdge,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.ac_unit),
                    SizedBox(width: 10,),
                    Text("data"),
                    SizedBox(width: 10,),
                    Icon(Icons.ac_unit),
                  ],
                )
              ),
              OutlinedButton(
                onPressed: printSecond,
                child: Text(
                    "Press me"
                ),
                style: style,
              ),
              TextButton(
                onPressed: printThird,
                child: Text(
                    "Press me"
                ),
                style: style,
              ),
              IconButton(
                onPressed: printFourth,
                icon: Icon(Icons.ac_unit),
                iconSize: 48,
                splashRadius: 300,
                disabledColor: Colors.pink,
                highlightColor: Colors.green,
                splashColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
