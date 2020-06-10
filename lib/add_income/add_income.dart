import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AddIncomeState extends State<AddIncome>
    with SingleTickerProviderStateMixin {
  Animation<Offset> animation;
  AnimationController controller;
  final int origin;
  int id = 2;

  AddIncomeState(this.origin);

  @override
  void initState() {
    super.initState();
    Offset start = Offset(-1, 0.0);
    Offset end = Offset.zero;

    if (this.origin < id) {
      start = Offset(1, 0.0);
      end = Offset.zero;
    }

    controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation = Tween<Offset>(begin: start, end: end).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "Add Income",
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
                  color: Color.fromRGBO(64, 152, 100, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.3, 8.5, 16.3, 8.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Halo',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        Text('30 Mei 2020',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            )),
                        Text('50.000',
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
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AddIncome extends StatefulWidget {
  final int origin;

  AddIncome(this.origin);

  @override
  AddIncomeState createState() => AddIncomeState(this.origin);
}
