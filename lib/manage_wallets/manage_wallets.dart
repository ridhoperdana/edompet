import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:edompet/utils.dart';

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
