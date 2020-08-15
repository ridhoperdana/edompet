import 'package:flutter/material.dart';
import 'package:edompet/models/transaction.dart';
import 'package:edompet/repository/db.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  String headerTitle = '';

  @override
  void initState() {
    super.initState();
    if (widget.transactionType == 'expense') {
      this.headerTitle = 'All Expenses';
    } else if (widget.transactionType == 'income') {
      this.headerTitle = 'All Incomes';
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
              child: ListViewTransactions(widget.transactionType),
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
  Operation dbHelper = Operation();
  Future<List<Transaction>> futureTranscation;

  String transactionType;

  ListViewTransactionsState(String transactiontype) {
    this.transactionType = transactiontype;
  }

  void initState() {
    super.initState();
    futureTranscation = dbHelper.fetchTransactions(this.transactionType);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureTranscation,
        builder: (context, snap) {
          if (snap.hasData) {
            List<Transaction> transactionsData = snap.data.toList();
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
                          transactionsData[index].shortDescription,
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
                          transactionsData[index].getStringCreatedTime,
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
                          FlutterMoneyFormatter(
                                  amount: transactionsData[index]
                                      .moneySpent
                                      .toDouble(),
                                  settings: MoneyFormatterSettings(
                                      symbol: 'IDR',
                                      thousandSeparator: '.',
                                      decimalSeparator: ',',
                                      symbolAndNumberSeparator: ' ',
                                      fractionDigits: 2,
                                      compactFormatType:
                                          CompactFormatType.short))
                              .output
                              .withoutFractionDigits
                              .toString(),
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
          } else {
            return Container();
          }
        });
  }
}

class ListViewTransactions extends StatefulWidget {
  final String transactionType;

  ListViewTransactions(this.transactionType);

  @override
  ListViewTransactionsState createState() =>
      ListViewTransactionsState(this.transactionType);
}
