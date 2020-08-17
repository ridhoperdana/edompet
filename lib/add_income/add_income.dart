import 'package:edompet/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:edompet/models/transaction.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:edompet/repository/db.dart';

class AddIncomeState extends State<AddIncome>
    with SingleTickerProviderStateMixin {
  Animation<Offset> animation;
  AnimationController controller;
  final int origin;
  int id = 2;

  Operation dbHelper = Operation();

  Service service = Service();

  AddIncomeState(this.origin);

  final _transaction = Transaction('income');
  TextEditingController dateCtl = TextEditingController();
  String dateTimeText = '';

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

  void saveData() async {
    try {
      var walletID = await service.getWalletID();
      this._transaction.walletID = walletID;
      await dbHelper.insertTransaction(this._transaction);
      widget.changeTab(0);
    } catch (e) {
      print('Error storing data $e');
    }
  }

  void callDatePicker() async {
    initializeDateFormatting();
    var order = await DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true,
        minTime: DateTime(2000, 1, 1),
        maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
      setState(
        () {
          if (date != null) {
            dateTimeText = DateFormat('d MMMM y', 'id_ID').format(date);
            dateCtl.text = dateTimeText;
            _transaction.dateTime = date;
          }
        },
      );
    }, currentTime: DateTime.now(), locale: LocaleType.en);
    setState(() {
      if (order != null) {
        dateTimeText = DateFormat('d MMMM y', 'id_ID').format(order);
        dateCtl.text = dateTimeText;
        _transaction.dateTime = order;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SlideTransition(
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
              height: 121,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 27),
              child: Card(
                elevation: 5,
                color: Color.fromRGBO(64, 152, 100, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.3, 8.5, 16.3, 8.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_transaction.shortDescription,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(dateTimeText,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          )),
                      Text(_transaction.moneySpent.toString(),
                          style: TextStyle(
                            fontSize: 33,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 334,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
                color: Color.fromRGBO(248, 248, 248, 1),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(21, 0, 21, 27),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Money Spent'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter money spent value.';
                          }
                        },
                        onChanged: (val) => setState(() {
                          _transaction.moneySpent = int.parse(val);
                        }),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(labelText: 'Date'),
                        controller: dateCtl,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the date transaction happen';
                          }
                        },
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          callDatePicker();
                        },
                        onChanged: (val) => setState(() {
                          _transaction.dateTime = DateTime.parse(val);
                        }),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.text,
                        decoration:
                            InputDecoration(labelText: 'Short Description'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter short description for the transaction.';
                          }
                        },
                        onChanged: (val) => setState(() {
                          _transaction.shortDescription = val;
                        }),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: 'Category'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter category of the transaction.';
                          }
                        },
                        onChanged: (val) => setState(() {
                          _transaction.category = val;
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () => saveData(),
                    child: Container(
                      child: Card(
                        color: Color.fromRGBO(64, 152, 100, 1),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          width: 90,
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AddIncome extends StatefulWidget {
  final int origin;
  final Function changeTab;

  AddIncome(this.origin, this.changeTab);

  @override
  AddIncomeState createState() => AddIncomeState(this.origin);
}
