import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  final Widget bodySection = Column(
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
        Container(
          child: SvgPicture.asset(
            'asset/images/export.svg',
            color: Colors.blue,
            height: 24,
          ),
          alignment: Alignment.topRight,
          padding: const EdgeInsets.fromLTRB(1.0, 50.0, 20.0, 1.0),
        )
      ]),
      Container(
        alignment: Alignment(-1, -1),
        padding: EdgeInsets.fromLTRB(22, 32, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Uang bulanan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
              child: Text(
                'Your current money...',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 4,
              width: 63,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.green,
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
                Text(
                  '10.500.000',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        height: 500,
        child: ListViewHome(),
        width: 1000,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: bodySection);
  }
}

class ListViewTransactionsState extends State<ListViewTransactions> {
  @override
  Widget build(BuildContext context) {
    final transactionsData = [
      {
        "title": "Tagihan kartu kredit",
        "date": "4 April 2020",
        "value": 360000,
        "type": "expense"
      },
      {
        "title": "Tagihan netflix",
        "date": "3 April 2020",
        "value": 169000,
        "type": "expense"
      },
      {
        "title": "Jual usb type c hub",
        "date": "1 April 2020",
        "value": 150000,
        "type": "income"
      }
    ];

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 20, 23, 0),
      itemCount: transactionsData.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        switch (transactionsData[index]["type"]) {
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
                    Text(transactionsData[index]["title"],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    Text(transactionsData[index]["date"],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        )),
                    Text(transactionsData[index]["value"].toString(),
                        style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                        )),
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
                    Text(transactionsData[index]["title"],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    Text(transactionsData[index]["date"],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        )),
                    Text(transactionsData[index]["value"].toString(),
                        style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            );
          default:
            return ErrorWidget('this is error');
        }
      },
    );
  }
}

class ListViewTransactions extends StatefulWidget {
  @override
  ListViewTransactionsState createState() => ListViewTransactionsState();
}

class ListViewHomeState extends State<ListViewHome> {
  @override
  Widget build(BuildContext context) {
    final transactionsData = [
      {"title": "Last 3 Transactions"},
      {"title": "Last 3 Expenses"},
      {"title": "Last 3 Incomes"}
    ];

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 5, 23, 0),
      itemCount: transactionsData.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.topLeft,
          color: Colors.amber,
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
                                child: ListViewTransactions(),
                                width: 300,
                                height: 324,
                              ),
                              Card(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('Load More'),
                                  width: 219,
                                  height: 31,
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
  @override
  ListViewHomeState createState() => ListViewHomeState();
}
