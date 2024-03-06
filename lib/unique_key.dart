import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  List<Widget> tiles = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatelessColorfulTitle(color: Colors.red, key: UniqueKey(),),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatelessColorfulTitle(color: Colors.black, key: UniqueKey(),),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(tiles[0]);
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: swapTiles,
              child: Text(
                  "toggle"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: tiles,
            )
          ],
        ),
      ),
    );
  }
  void swapTiles(){
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTitle extends StatefulWidget {
  final color;
  const StatelessColorfulTitle({super.key, required this.color});

  @override
  State<StatelessColorfulTitle> createState() => _StatelessColorfulTitleState();
}

class _StatelessColorfulTitleState extends State<StatelessColorfulTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: this.widget.color,
    );
  }
}
