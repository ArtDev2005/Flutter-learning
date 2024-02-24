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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                TextField(
                  inputFormatters: [
                    PhoneInputFormatter(),//регулярные выражения
                    //FilteringTextInputFormatter.allow(RegExp(r'[/d]+')),
                  ],

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), ''); // заменяет все что не удовлетворяет условию
    final initialSpecialSymbolCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]+'), '')
        .length;
    final cursorPosition = newValue.selection.start - initialSpecialSymbolCount;
    print(cursorPosition);
    var finalCursorPosition = cursorPosition;
    final digitsOnlyChars = digitsOnly.split('');
    var newString = <String>[];
    for (var i = 0; i < digitsOnlyChars.length; i++){
      if (i == 3 || i == 6 || i == 8) {
        newString.add(' ');
        if (i <= cursorPosition) finalCursorPosition++;
      }
      newString.add(digitsOnlyChars[i]);

    }
    final resultString = newString.join('');
    print("final $finalCursorPosition");
    print("result string $resultString");
    return TextEditingValue(
        text: resultString,
        selection: TextSelection.collapsed(offset: finalCursorPosition) // положение курсора
    );
  }
}

