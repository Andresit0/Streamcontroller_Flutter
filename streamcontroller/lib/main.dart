import 'dart:async';

import 'package:flutter/material.dart';

import 'dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> counter2 = StreamController.broadcast();
  int counter = 0;

  void dialog() {
    dialogHeaderBodyFooter(
        context,
        Colors.red,
        Text('Stream Controller'),
        Colors.black,
        Container(
          child: Column(
            children: [
              Text('Data ' + counter.toString()),
              StreamBuilder<int>(
                  initialData: 0,
                  stream: counter2.stream,
                  builder: (context, AsyncSnapshot snapshot) {
                    return Text(
                      'Data ' + snapshot.data.toString(),
                    );
                  }),
              Expanded(child: Container()),
              TextButton(
                  onPressed: () {
                    counter++;
                    print(counter.toString());
                    counter2.add(counter);
                    setState(() {});
                  },
                  child: Icon(Icons.add))
            ],
          ),
        ),
        [],
        200,
        200);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialog();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
