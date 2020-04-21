import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 21.32, date: DateTime.now()),
    Transaction(id: 't2', title: 'Big Bazaar', amount: 13.21, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XpensO'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, //main axis is long main line telling how children are placed along
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Container(
              child: Text("Chart"),
              width: double.infinity,
            ),
            elevation: 10,
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 1 )),
                    child: Text("\$${tx.amount}", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,)),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tx.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Text(DateFormat('EEE, d/M/y').format(tx.date), style: TextStyle(color: Colors.grey),)
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
