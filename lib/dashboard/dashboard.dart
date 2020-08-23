import 'package:edompet/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/rendering.dart';
import 'package:edompet/models/transaction.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:edompet/service/service.dart';
import 'package:edompet/models/wallet.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  Future<DataDashboard> data;
  Service service = Service();

  void initState() {
    super.initState();
    try {
      data = service.getData();
    } catch (e) {
      print('Error count $e');
    }
  }

  void downloadCSV(ProgressDialog pr) async {
    await pr.show();
    var data = await service.generateCSV();
    await pr.hide();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/' + 'data.csv');
    await file.writeAsString(data);
  }

  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: true,
    );

    pr.style(message: 'Converting data to CSV');
    return FutureBuilder<DataDashboard>(
        future: data,
        builder: (context, snap) {
          if (snap.hasData) {
            var currentWallet = Wallet('', 0, '#FFFFFF');
            if (snap.data.getWallet != null) {
              currentWallet = snap.data.getWallet;
            }

            return SingleChildScrollView(
                child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 28.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 1.0, 1.0),
                      alignment: Alignment.topLeft,
                    ),
                    Spacer(),
                    InkWell(
                      child: Container(
                        child: SvgPicture.asset(
                          'asset/images/export.svg',
                          color: Colors.blue,
                          height: 24,
                        ),
                        alignment: Alignment.topRight,
                        padding:
                            const EdgeInsets.fromLTRB(1.0, 50.0, 20.0, 1.0),
                      ),
                      onTap: () {
                        downloadCSV(pr);
                      },
                    ),
                  ]),
                  Container(
                    alignment: Alignment(-1, -1),
                    padding: EdgeInsets.fromLTRB(22, 32, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            currentWallet.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                          child: Text(
                            'Your current money...',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 63,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: HexColor(currentWallet.color),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Rp.',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 40,
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                child: Text(
                                  FlutterMoneyFormatter(
                                          amount: currentWallet.initialMoney
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
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: ListViewHome(int.parse(currentWallet.id)),
                    width: 1000,
                  ),
                ],
              ),
            ));
          } else {
            return Container();
          }
        });
  }
}

class ListViewTransactionsState extends State<ListViewTransactions> {
  Future<List<Transaction>> futureTranscation;
  Service service = Service();

  String transactionType;
  int walletID;

  ListViewTransactionsState(String transactiontype, int walletID) {
    this.transactionType = transactiontype;
    this.walletID = walletID;
  }

  void updateListView() {
    setState(() {
      try {
        futureTranscation =
            service.fetchTransactions(this.transactionType, this.walletID);
      } catch (e) {
        print('error getting database: $e');
      }
    });
  }

  void initState() {
    super.initState();
    initializeDateFormatting();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: futureTranscation,
      builder: (context, snap) {
        if (snap.hasData) {
          List<Transaction> transactionsData = snap.data.toList();
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 20, 23, 0),
            itemCount: transactionsData.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              switch (transactionsData[index].type) {
                case "expense":
                  return Card(
                    color: Color.fromRGBO(255, 111, 111, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.3, 8.5, 16.3, 8.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(transactionsData[index].shortDescription,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          Text(transactionsData[index].getStringCreatedTime,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              )),
                          Text(
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
                              fontSize: 29,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  break;
                case "income":
                  return Card(
                    color: Color.fromRGBO(64, 152, 100, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.3, 8.5, 16.3, 8.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(transactionsData[index].shortDescription,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          Text(transactionsData[index].getStringCreatedTime,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              )),
                          Text(
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
                              fontSize: 29,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                default:
                  return ErrorWidget('this is error');
              }
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ListViewTransactions extends StatefulWidget {
  final String transactionType;
  final int walletID;

  ListViewTransactions({Key key, this.transactionType, this.walletID})
      : super(key: key);

  @override
  ListViewTransactionsState createState() =>
      ListViewTransactionsState(this.transactionType, this.walletID);
}

class ListViewHomeState extends State<ListViewHome> {
  void _allTransactions(String transactionType) {
    Navigator.of(context).pushNamed("/transactions",
        arguments: '$transactionType:${widget.walletID}');
  }

  @override
  Widget build(BuildContext context) {
    final transactionsData = [
      {"title": "Last 3 Transactions", "type": "all"},
      {"title": "Last 3 Expenses", "type": "expense"},
      {"title": "Last 3 Incomes", "type": "income"}
    ];

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 5, 23, 0),
      itemCount: transactionsData.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Container(
                height: 487,
                width: 306,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(17, 20, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  transactionsData[index]["title"],
                                  style: TextStyle(
                                      color: Color.fromRGBO(51, 51, 51, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                                width: 228,
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              ),
                              Container(
                                height: 4,
                                width: 63,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                alignment: Alignment(-1, -1),
                                child: ListViewTransactions(
                                    transactionType: transactionsData[index]
                                        ["type"],
                                    walletID: widget.walletID),
                                width: 300,
                                height: 324,
                              ),
                              Card(
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Load More'),
                                    width: 219,
                                    height: 31,
                                  ),
                                  onTap: () {
                                    _allTransactions(
                                        transactionsData[index]["type"]);
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: Color.fromRGBO(227, 227, 227, 1),
                              )
                            ],
                          )),
                    ],
                  ),
                  elevation: 5,
                  color: Color.fromRGBO(248, 248, 248, 1),
                  margin: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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

class ListViewHome extends StatefulWidget {
  final int walletID;
  ListViewHome(this.walletID);

  @override
  ListViewHomeState createState() => ListViewHomeState();
}
