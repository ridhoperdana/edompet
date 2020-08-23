import 'package:edompet/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edompet/models/transaction.dart';
import 'package:edompet/repository/db.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  String headerTitle = '';
  String transactionType = '';
  int walletID = 0;

  @override
  void initState() {
    super.initState();
    var transactionIDAndWalletIDSplitted =
        widget.transactionTypeWithWalletID.split(":");

    this.transactionType = transactionIDAndWalletIDSplitted[0];
    this.walletID = int.parse(transactionIDAndWalletIDSplitted[1]);
    if (transactionType == 'expense') {
      this.headerTitle = 'All Expenses';
    } else if (transactionType == 'income') {
      this.headerTitle = 'All Incomes';
    } else if (transactionType == 'all') {
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
              child: ListViewTransactions(this.transactionType, this.walletID),
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
  final String transactionTypeWithWalletID;

  Transactions(this.transactionTypeWithWalletID);

  @override
  TransactionsState createState() => TransactionsState();
}

class ListViewTransactionsState extends State<ListViewTransactions> {
  Operation dbHelper = Operation();
  Future<List<Transaction>> futureTranscation;

  String transactionType;
  int walletID;

  Service service = Service();

  ListViewTransactionsState(String transactiontype, int walletID) {
    this.transactionType = transactiontype;
    this.walletID = walletID;
  }

  void initState() {
    super.initState();
    futureTranscation =
        dbHelper.fetchTransactions(this.transactionType, this.walletID);
  }

  void delete(int id) async {
    await service.deleteTransaction(id);
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
                return Slidable(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                            width: 2, color: Color.fromRGBO(227, 227, 227, 1)),
                      ),
                    ),
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
                      ],
                    ),
                  ),
                  actionPane: SlidableBehindActionPane(),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.black45,
                      icon: Icons.edit,
                      onTap: () {
                        Navigator.pushNamed(context, "/edit-expense",
                            arguments: transactionsData[index]);
                      },
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => showPlatformDialog(
                          context: context,
                          builder: (context) {
                            return PlatformAlertDialog(
                              cupertino: (context, platform) {
                                return CupertinoAlertDialogData(actions: [
                                  CupertinoDialogAction(
                                    child: Text("No"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text("Yes"),
                                    onPressed: () {
                                      delete(int.parse(
                                          transactionsData[index].id));
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, "/", (route) => false);
                                    },
                                  ),
                                ]);
                              },
                              content: Text("Are you sure want to delete?"),
                            );
                          }),
                    ),
                  ],
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
  final int walletID;

  ListViewTransactions(this.transactionType, this.walletID);

  @override
  ListViewTransactionsState createState() =>
      ListViewTransactionsState(this.transactionType, this.walletID);
}
