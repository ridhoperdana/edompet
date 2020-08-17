import 'package:edompet/models/wallet.dart';
import 'package:edompet/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edompet/utils.dart';
import 'package:edompet/repository/db.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ManageWalletState extends State<ManageWallet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/new-wallet");
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                "Manage Wallets",
                style: TextStyle(
                    fontSize: 28.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto"),
              ),
              padding: const EdgeInsets.fromLTRB(20.0, 0, 1.0, 39),
              alignment: Alignment.topLeft,
            ),
            Expanded(
                child: Container(
              child: ListViewTransactions(widget.changeToTab),
              width: 400,
              height: 580,
              padding: EdgeInsets.all(0),
            )),
          ],
        ),
      ),
    );
  }
}

class ManageWallet extends StatefulWidget {
  final Function changeToTab;

  ManageWallet(this.changeToTab);

  @override
  ManageWalletState createState() => ManageWalletState();
}

class ListViewTransactionsState extends State<ListViewTransactions> {
  Operation dbHelper = Operation();
  Future<List<Wallet>> futureWallet;
  Service service = Service();

  void initState() {
    super.initState();
    try {
      futureWallet = dbHelper.fetchWallet();
    } catch (e) {
      print('Fetch wallet error: $e');
    }
  }

  void delete(int id) async {
    await service.deleteWallet(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Wallet>>(
        future: futureWallet,
        builder: (context, snap) {
          if (snap.hasData) {
            List<Wallet> walletsData = snap.data.toList();
            return ListView.builder(
              itemCount: walletsData.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.fromLTRB(21, 0, 20, 0),
              itemBuilder: (context, index) {
                return Container(
                  child: InkWell(
                    onTap: () {
                      showPlatformModalSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return PlatformWidget(
                              cupertino: (_, __) {
                                return CupertinoActionSheet(
                                  actions: [
                                    CupertinoActionSheetAction(
                                        onPressed: () {
                                          service.updateCurrentWallet(
                                              walletsData[index].id);
                                          Navigator.pop(context);
                                          widget.changeToTab(0);
                                        },
                                        child: Text('Choose')),
                                    CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Edit')),
                                    CupertinoActionSheetAction(
                                        onPressed: () {
                                          delete(
                                              int.parse(walletsData[index].id));
                                          Navigator.pop(context);
                                          Navigator.pushNamedAndRemoveUntil(
                                              context, "/", (route) => false);
                                        },
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                  ],
                                );
                              },
                              material: (_, __) {
                                return Container(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          title: Text('Choose'),
                                          onTap: () {
                                            service.updateCurrentWallet(
                                                walletsData[index].id);
                                            Navigator.pop(context);
                                            widget.changeToTab(0);
                                          }),
                                      ListTile(
                                        title: Text('Edit'),
                                        onTap: () => {},
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onTap: () {
                                          delete(
                                              int.parse(walletsData[index].id));
                                          Navigator.pop(context);
                                          Navigator.pushNamedAndRemoveUntil(
                                              context, "/", (route) => false);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          });
                    },
                    child: Card(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      elevation: 5,
                      color: HexColor(walletsData[index].color),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.3, 26, 16.3, 26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(walletsData[index].name,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                            Text(
                                FlutterMoneyFormatter(
                                        amount: walletsData[index]
                                            .initialMoney
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
                                )),
                          ],
                        ),
                      ),
                    ),
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
  final Function changeToTab;

  ListViewTransactions(this.changeToTab);

  @override
  ListViewTransactionsState createState() => ListViewTransactionsState();
}
