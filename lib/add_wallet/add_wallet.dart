import 'package:flutter/material.dart';
import 'package:edompet/models/wallet.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddWalletState extends State<AddWallet> {
  int id = 2;

  AddWalletState();

  // final _formKey = GlobalKey();
  Wallet wallet = Wallet('', 0, '');
  Color currentColor = Color.fromRGBO(64, 152, 100, 1);

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "Add Wallet",
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
                color: this.currentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.3, 8.5, 16.3, 8.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(wallet.name,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(wallet.initialMoney.toString(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Wallet's Name"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter wallet name.';
                          }
                          return '';
                        },
                        onChanged: (val) => setState(() {
                          wallet.name = val;
                        }),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Money Spent'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter initial money value';
                          }
                          return '';
                        },
                        onChanged: (val) => setState(() {
                          wallet.initialMoney = int.parse(val);
                        }),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Color',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Select a color'),
                                          content: SingleChildScrollView(
                                            child: BlockPicker(
                                              pickerColor: currentColor,
                                              onColorChanged: changeColor,
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  child: Card(
                                    color: this.currentColor,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      width: 90,
                                      child: Text(
                                        'Choose',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                    elevation: 5,
                                  ),
                                ),
                              )
                            ],
                          ))
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
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Select a color'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: currentColor,
                                  onColorChanged: changeColor,
                                ),
                              ),
                            );
                          });
                    },
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
    );
  }
}

class AddWallet extends StatefulWidget {
  @override
  AddWalletState createState() => AddWalletState();
}
