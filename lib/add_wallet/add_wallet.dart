import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AddWalletState extends State<AddWallet>
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
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
        child: Center(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Container(
                  width: 334,
                  height: 109,
                  child: Card(
                    color: Color.fromRGBO(255, 111, 111, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.3, 8.5, 16.3, 8.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Uang Bulanan',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          Text('1.000.000',
                              style: TextStyle(
                                fontSize: 29,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  )),
            ],
          )),
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

class AddWallet extends StatefulWidget {
  AddWallet({Key key}) : super(key: key);

  @override
  AddWalletState createState() => AddWalletState();
}
