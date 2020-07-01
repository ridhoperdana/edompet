import 'package:flutter/material.dart';

class TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  String headerTitle = '';

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
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
            )),
          ],
        ),
      ),
    );
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
    final transactionsData = [
      {
        "title": "Tagihan kartu kredit",
        "date": "4 April 2020",
        "value": 360000,
      },
      {
        "title": "Tagihan netflix",
        "date": "3 April 2020",
        "value": 169000,
      },
      {
        "title": "Jual usb type c hub",
        "date": "1 April 2020",
        "value": 150000,
      },
      {
        "title": "Tagihan kartu kredit",
        "date": "4 April 2020",
        "value": 360000,
      },
      {
        "title": "Tagihan netflix",
        "date": "3 April 2020",
        "value": 169000,
      },
      {
        "title": "Jual usb type c hub",
        "date": "1 April 2020",
        "value": 150000,
      },
      {
        "title": "Tagihan kartu kredit",
        "date": "4 April 2020",
        "value": 360000,
      },
      {
        "title": "Tagihan netflix",
        "date": "3 April 2020",
        "value": 169000,
      },
      {
        "title": "Jual usb type c hub",
        "date": "1 April 2020",
        "value": 150000,
      },
      {
        "title": "Tagihan kartu kredit",
        "date": "4 April 2020",
        "value": 360000,
      },
      {
        "title": "Tagihan netflix",
        "date": "3 April 2020",
        "value": 169000,
      },
      {
        "title": "Jual usb type c hub",
        "date": "1 April 2020",
        "value": 150000,
      }
    ];

    return ListView.builder(
      itemCount: transactionsData.length,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.fromLTRB(21, 0, 21, 0),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  transactionsData[index]["title"],
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  transactionsData[index]["date"],
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: Text(
                  transactionsData[index]["value"].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 400,
                ),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(227, 227, 227, 1),
                  ),
                ),
              ),
            ],
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
