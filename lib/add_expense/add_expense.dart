import 'package:edompet/service/service.dart';
import 'package:flutter/material.dart';
import 'package:edompet/models/transaction.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class AddExpenseState extends State<AddExpense> {
  int id = 1;

  var _transaction = Transaction('expense');
  TextEditingController dateCtl = TextEditingController();
  String dateTimeText = '';

  Service service = Service();

  Color cardColor = Color.fromRGBO(255, 111, 111, 1);
  String headerTitle = 'Add Expense';

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      this._transaction = widget.transaction;
      dateTimeText =
          DateFormat('d MMMM y', 'id_ID').format(this._transaction.dateTime);
      dateCtl.text = dateTimeText;
      switch (widget.transaction.type) {
        case "income":
          cardColor = Color.fromRGBO(64, 152, 100, 1);
          headerTitle = 'Edit Income';
          break;
        case "expense":
          headerTitle = 'Edit Expense';
          break;
        default:
      }
    }
  }

  void saveData() async {
    if (widget.transaction != null) {
      try {
        await service.updateTransaction(this._transaction);
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      } catch (e) {
        print('Error updating transaction $e');
      }
    } else {
      try {
        var walletID = await service.getWalletID();
        this._transaction.walletID = walletID;
        await service.insertTransaction(this._transaction);
        widget.changeTab(0);
      } catch (e) {
        print('Error storing transaction $e');
      }
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

  bool isEdit() {
    if (widget.transaction != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
            child: Center(
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      headerTitle,
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
                      color: cardColor,
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
                            Text(
                                FlutterMoneyFormatter(
                                        amount:
                                            _transaction.moneySpent.toDouble(),
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
                              initialValue: _transaction.moneySpent.toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: 'Money Spent'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter money spent value.';
                                }
                                return '';
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
                                return '';
                              },
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                callDatePicker();
                              },
                              onChanged: (val) => setState(() {
                                _transaction.dateTime = DateTime.parse(val);
                              }),
                            ),
                            TextFormField(
                              initialValue: _transaction.shortDescription,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: 'Short Description'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter short description for the transaction.';
                                }
                                return '';
                              },
                              onChanged: (val) => setState(() {
                                _transaction.shortDescription = val;
                              }),
                            ),
                            TextFormField(
                              initialValue: _transaction.category,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.text,
                              decoration:
                                  InputDecoration(labelText: 'Category'),
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
                        if (isEdit())
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Card(
                                color: Colors.grey,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  width: 90,
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                elevation: 5,
                              ),
                            ),
                          ),
                        InkWell(
                          onTap: () => saveData(),
                          child: Container(
                            child: Card(
                              color: cardColor,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                width: 90,
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
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
            )),
      )),
    );
  }
}

class AddExpense extends StatefulWidget {
  final Function changeTab;
  final Transaction transaction;

  AddExpense(this.changeTab, {this.transaction});

  AddExpense.edit(this.transaction, {this.changeTab});

  @override
  AddExpenseState createState() => AddExpenseState();
}
