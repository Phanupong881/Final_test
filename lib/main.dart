import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> totals = [0,0,0,0,0,0,0,0,0,0];
  int _dice1 = 0;
  int _dice2 = 0;
  int _total = 0;


  void _randomdice() {
    setState(() {
      Random random = Random();
      int a = random.nextInt(7);
      int b = random.nextInt(7);
      _dice1 = a;
      _dice2 = b;
    });

  }
  void _reset() {
    setState(() {
      _dice1 = 0;
      _dice2 = 0;
      _total = 0;
      totals = [0,0,0,0,0,0,0,0,0,0];
    });
  }
  void _List1() {
    setState(() {
      for(var _total1 = _total; _total < totals.length; _total1++){
        totals[0] = _total1;
      }
    });
  }

  void total() {
    setState(() {
       _total = _dice1 + _dice2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          children: <Widget>
          [Text('ค่าลูกเต๋า1'),Text('$_dice1'),
            Text('ค่าลูกเต๋า2'),Text('$_dice2'),
            Text('ผลรวมทั้งสองลูก'),Text('$_total'),
          IconButton(onPressed: ()=>[_randomdice(),total()], icon: Image.asset('images/dice.gif'),iconSize: 100,),
            TextButton(onPressed: _reset, child: Text('Reset')),
            TextButton(onPressed: ()=>[_List1(),], child: Text('ค่าย้อนหลัง')),
            Text('ผลรวมทั้งสองลูก'),Text('$totals'),
          ]
        )
    )
    );
  }
}
