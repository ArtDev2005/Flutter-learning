import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Directionality(
              textDirection: TextDirection.ltr,
              child: OwnListView() // или OwnScrollView()
        ),
      ),
    );
  }
}


class OwnListView extends StatelessWidget {
  const OwnListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index){
          return Container(height: 10, color: Colors.black,);
        },
        itemCount: 20,
        itemBuilder: (BuildContext context, int index){
          return Ex(text: "${index}");
        });
  }
}



class Ex extends StatefulWidget {
  final String text;
  const Ex({super.key, required this.text});

  @override
  State<Ex> createState(){
    return _ExState();
  }
}

class _ExState extends State<Ex> with AutomaticKeepAliveClientMixin {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }
  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller,);
  }

  @override
  bool get wantKeepAlive => true;
}



class OwnScrollView extends StatelessWidget {
  OwnScrollView({super.key});
  final controller = ScrollController(initialScrollOffset: 150);

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];
    for (var i = 0; i < 100; i++){
      final w = Text("$i");
      items.add(w);
    }
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items,
        ),
      ),
    );
  }
}



