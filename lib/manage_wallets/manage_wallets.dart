import 'package:edompet/models/wallet.dart';
import 'package:edompet/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:edompet/utils.dart';
import 'package:edompet/repository/db.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ManageWalletState extends State<ManageWallet>
    with SingleTickerProviderStateMixin {
  Animation<Offset> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation = Tween<Offset>(begin: Offset(1, 0.0), end: Offset.zero)
        .animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: animation,
        child: Scaffold(
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
                  child: ListViewTransactions(),
                  width: 400,
                  height: 580,
                  padding: EdgeInsets.all(0),
                )),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ManageWallet extends StatefulWidget {
  ManageWallet({Key key}) : super(key: key);

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
                            return CupertinoActionSheet(
                              actions: [
                                CupertinoActionSheetAction(
                                    onPressed: () {
                                      service.updateCurrentWallet(
                                          walletsData[index].id);
                                      Navigator.pop(context);
                                      // Move to first tab (index tab = 0)
                                    },
                                    child: Text('Choose')),
                                CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Edit')),
                              ],
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
  @override
  ListViewTransactionsState createState() => ListViewTransactionsState();
}
