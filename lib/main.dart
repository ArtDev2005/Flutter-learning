import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'app.dart';


void main(){
  runApp(Example());
}


class Example extends StatefulWidget {

  Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final controllerOne = TextEditingController();
  final controllerTwo = TextEditingController();
  final nodeOne = FocusNode();
  final nodeTwo = FocusNode();

  void _onChanged(String text){
    print("_onChanged $text");
  }

  void _onEditingComplete(){
    print("_onEditingComplete");
  }

  void _onSubmitted(String text){
    print("_onSubmitted $text");
  }

  void _onTap(){
    print(nodeOne.hasFocus);
    print(nodeTwo.hasFocus);
    print("_onTap");
  }

  void _onAppPrivateCommand(String text, Map<String, dynamic> arguments){
    print("_onAppPrivateCommand $text");
    print("_onAppPrivateCommand $arguments");
  }

  void _onListen(){
    controllerTwo.text = controllerOne.text.toUpperCase();
  }

  void onButtonTap(){
    controllerOne.value = TextEditingValue(
      text: "asdasdas",
      selection: TextSelection.collapsed(offset: 0) // управление курсором,
      // TextSelection(baseOffset, extentOffset) - выделение подстроки

    );
    controllerOne.addListener(_onListen);
    controllerOne.removeListener(_onListen);
    controllerTwo.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  focusNode: nodeOne,
                  controller: controllerOne,
                  onChanged: _onChanged,
                  onTap: _onTap,
                  onEditingComplete: _onEditingComplete,
                  onSubmitted: _onSubmitted,
                  readOnly: false,
                  //keyboardAppearance: Brightness.dark,
                  //keyboardType: TextInputType.emailAddress,
                  showCursor: true,
                  cursorWidth: 2,
                  //textCapitalization: TextCapitalization.sentences,
                  //smartDashesType: SmartDashesType.enabled,
                  //smartQuotesType: SmartQuotesType.disabled,
                  //enableInteractiveSelection: true, // выделение в текстовом поле
                  //toolbarOptions: ToolbarOptions(),
                  //selectionHeightStyle: ui.BoxHeightStyle.max,
                  //maxLines: null,
                  //minLines: null,
                  //expands: true,
                  //maxLength: 10,
                  //maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  //textAlign: TextAlign.justify,


                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                TextField(
                  focusNode: nodeTwo,
                  controller: controllerTwo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onButtonTap,
                  child: Icon(Icons.ac_unit),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
