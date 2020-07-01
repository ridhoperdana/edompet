import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:edompet/utils.dart';

class TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  Animation<Offset> animation;
  AnimationController controller;
  String headerTitle = '';

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation = Tween<Offset>(begin: Offset(1, 0.0), end: Offset.zero)
        .animate(controller);
    controller.forward();
    if (widget.transactionType == 'expense') {
      this.headerTitle = 'All Expenses';
    } else if (widget.transactionType == 'income') {
      this.headerTitle = 'All Income';
    } else if (widget.transactionType == 'all') {
      this.headerTitle = 'All Transactions';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 1.0, 30),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        child: Text(
                          headerTitle,
                          style: TextStyle(
                              fontSize: 28.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  )),
              Expanded(
                  child: Container(
                child: ListViewTransactions(),
                width: 400,
                height: 580,
                // padding: EdgeInsets.all(0),
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Transactions extends StatefulWidget {
  final String transactionType;
  Transactions(this.transactionType);

  @override
  TransactionsState createState() => TransactionsState();
}

class ListViewTransactionsState extends State<ListViewTransactions> {
  @override
  Widget build(BuildContext context) {
    final walletsData = [
      {"name": "Uang Bulanan", "value": 360000, "color": "#409864"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
      {"name": "Tabungan Beli Game", "value": 169000, "color": "#ED7628"},
    ];

    return ListView.builder(
      itemCount: walletsData.length,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.fromLTRB(21, 0, 20, 0),
      itemBuilder: (context, index) {
        return Container(
          child: Card(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            elevation: 5,
            color: HexColor(walletsData[index]["color"]),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.3, 26, 16.3, 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(walletsData[index]["name"],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  Text(walletsData[index]["value"].toString(),
                      style: TextStyle(
                        fontSize: 29,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ListViewTransactions extends StatefulWidget {
  @override
  ListViewTransactionsState createState() => ListViewTransactionsState();
}
