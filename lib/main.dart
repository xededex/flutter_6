import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endless ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Endless ListView Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _array = [];

  String getElement(int ind){
    return '3 ^ $ind = ${pow(3, ind).toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(itemBuilder: (context, i){
        print('num $i : нечетное = ${i.isOdd}');

        if(i.isOdd) return const Divider();

        final int index = i ~/ 2;

        print('index $index');
        print('length ${_array.length}');

        if (index >= _array.length) _array.addAll([getElement(index+0), getElement(index+1), getElement(index+2)]);

        return ListTile(
            title: Text(_array[index])
        );

      })
    );
  }
}
