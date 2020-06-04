/*
*  home_widget.dart
*  Edompet
*
*  Created by Ridho Perdana.
*  Copyright © 2018 Anadrep. All rights reserved.
    */

import 'package:edompet/add_expenses_widget/add_expenses_widget.dart';
import 'package:edompet/add_income_widget/add_income_widget.dart';
import 'package:edompet/all_savings_widget/all_savings_widget.dart';
import 'package:edompet/home_widget/cell_item_widget.dart';
import 'package:edompet/values/values.dart';
import 'package:edompet/wallets_widget/wallets_widget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  void onExportPressed(BuildContext context) {}

  void onLoadMoreButtonPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => AllSavingsWidget()));

  void onExpenseIconPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddExpensesWidget()));

  void onHomeIconPressed(BuildContext context) {}

  void onSavingIconPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddIncomeWidget()));

  void onWalletIconPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => WalletsWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 44,
              margin: EdgeInsets.only(left: 29, top: 35, right: 29),
              child: Row(
                children: [
                  Text(
                    "Dashboard",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 51, 51, 51),
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 20,
                    height: 20,
                    child: FlatButton(
                      onPressed: () => this.onExportPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 0, 0, 0),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/export.png",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin:
                    EdgeInsets.only(left: 14, top: 23, right: 13, bottom: 13),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 627,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 278,
                                  height: 126,
                                  margin: EdgeInsets.only(left: 20, top: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 228,
                                          height: 60,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 22,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Text(
                                                      "Your current money..",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 52, 52, 52),
                                                        fontFamily: "Helvetica",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 23,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        width: 63,
                                                        height: 4,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              64,
                                                              152,
                                                              100),
                                                        ),
                                                        child: Container(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Text(
                                                  "Uang bulanan",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 51, 51, 51),
                                                    fontFamily: "Helvetica",
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 60,
                                        margin: EdgeInsets.only(bottom: 1),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: -5,
                                              right: 0,
                                              child: Text(
                                                "10.500.000",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontFamily: "Helvetica",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 50,
                                                  height: 1.2,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              top: 21,
                                              child: Text(
                                                "Rp.",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontFamily: "Helvetica",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 15, top: 11),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.all(0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 324,
                                          height: 446,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    141, 0, 0, 0),
                                                offset: Offset(2, 2),
                                                blurRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 306,
                                                height: 446,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 249, 249, 249),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(12)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 228,
                                                      height: 38,
                                                      margin: EdgeInsets.only(
                                                          left: 17, top: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 13),
                                                            child: Text(
                                                              "Last 3 Transactions",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        52,
                                                                        52,
                                                                        52),
                                                                fontFamily:
                                                                    "Helvetica",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 23,
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Container(
                                                              width: 63,
                                                              height: 4,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        64,
                                                                        152,
                                                                        100),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 267,
                                                      height: 300,
                                                      margin: EdgeInsets.only(
                                                          left: 17, top: 20),
                                                      child: ListView.builder(
                                                        itemCount: 15,
                                                        itemBuilder: (context,
                                                                index) =>
                                                            CellItemWidget(),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Container(
                                                        width: 261,
                                                        height: 33,
                                                        margin: EdgeInsets.only(
                                                            bottom: 20),
                                                        child: FlatButton(
                                                          onPressed: () => this
                                                              .onLoadMoreButtonPressed(
                                                                  context),
                                                          color: Color.fromARGB(
                                                              255,
                                                              228,
                                                              228,
                                                              228),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius: Radii
                                                                .k8pxRadius,
                                                          ),
                                                          textColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  51,
                                                                  51,
                                                                  51),
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          child: Text(
                                                            "Load More",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      51,
                                                                      51,
                                                                      51),
                                                              fontFamily:
                                                                  "Helvetica",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(113, 0, 0, 0),
                              offset: Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 75,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 249),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    offset: Offset(2, 2),
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 33,
                                    height: 51,
                                    child: FlatButton(
                                      onPressed: () =>
                                          this.onHomeIconPressed(context),
                                      color: Color.fromARGB(0, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      textColor:
                                          Color.fromARGB(255, 51, 51, 51),
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/browser.png",
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Home",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontFamily: "Helvetica",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 51,
                                    child: FlatButton(
                                      onPressed: () =>
                                          this.onExpenseIconPressed(context),
                                      color: Color.fromARGB(0, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      textColor:
                                          Color.fromARGB(255, 51, 51, 51),
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/bill-2.png",
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Expense",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontFamily: "Helvetica",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 37,
                                    height: 53,
                                    child: FlatButton(
                                      onPressed: () =>
                                          this.onSavingIconPressed(context),
                                      color: Color.fromARGB(0, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      textColor:
                                          Color.fromARGB(255, 51, 51, 51),
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/coin.png",
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Saving",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontFamily: "Helvetica",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 33,
                                    height: 51,
                                    child: FlatButton(
                                      onPressed: () =>
                                          this.onWalletIconPressed(context),
                                      color: Color.fromARGB(0, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      textColor:
                                          Color.fromARGB(255, 51, 51, 51),
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/money.png",
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Wallet",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontFamily: "Helvetica",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
