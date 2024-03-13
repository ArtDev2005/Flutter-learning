import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ExampleWidgetModel extends ChangeNotifier {
  Future<void> getFile() async {
    // pathProvider.getApplicationDocumentsDirectory(); // для файлов пользователя
    // pathProvider.getApplicationSupportDirectory(); // 
    // pathProvider.getTemporaryDirectory(); // кэш
    // pathProvider.getApplicationDocumentsDirectory();
    final directory = await pathProvider.getApplicationDocumentsDirectory();
    final path = directory.path + "/file.txt";
    final file = File(path);

    //await file.writeAsString("hello world");
    //final isExist = await file.exists();
    //final result = await file.readAsBytes();
    final fileSink = file.openWrite();
    fileSink.close();
    print(directory);
    print(file.readAsString());
  }

  void readFile() async {
    final file = await getFile();
    //final isExist = await file.exists();
    //if (!isExist) return;
    //final result = file.readAsString();
  }

  void createFile() async {
    final file = await getFile();
    //await file.writeAsString('Привет Мир!!!');
  }
}

class ExampleWidgetModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;
  const ExampleWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
    key: key,
    notifier: model,
    child: child,
  );

  static ExampleWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ExampleWidgetModelProvider>();
  }

  static ExampleWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleWidgetModelProvider>()
        ?.widget;
    return widget is ExampleWidgetModelProvider ? widget : null;
  }
}