/*
*  all_savings_widget.dart
*  Edompet
*
*  Created by Ridho Perdana.
*  Copyright © 2018 Anadrep. All rights reserved.
    */

import 'package:edompet/all_savings_widget/cell_two_item_widget.dart';
import 'package:edompet/values/values.dart';
import 'package:flutter/material.dart';


class AllSavingsWidget extends StatelessWidget {
  
  void onLeftArrowPressed(BuildContext context) => Navigator.pop(context);
  
  void onExportPressed(BuildContext context) {
  
  }
  
  void onFilterButtonPressed(BuildContext context) {
  
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 324,
              height: 44,
              margin: EdgeInsets.only(left: 21, top: 37),
              child: Row(
                children: [
                  Container(
                    width: 23,
                    height: 19,
                    child: FlatButton(
                      onPressed: () => this.onLeftArrowPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 0, 0, 0),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/left-arrow-2.png",),
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
                  Container(
                    width: 252,
                    margin: EdgeInsets.only(left: 19),
                    child: Text(
                      "All Transactions",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
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
                          Image.asset("assets/images/export.png",),
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
            Container(
              width: 333,
              height: 673,
              margin: EdgeInsets.only(left: 21, top: 31),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 24,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Positioned(
                                left: 0,
                                right: 6,
                                bottom: 0,
                                child: Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 216, 216, 216),
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Positioned(
                                right: 7,
                                child: FlatButton(
                                  onPressed: () => this.onFilterButtonPressed(context),
                                  color: Color.fromARGB(0, 0, 0, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(0)),
                                  ),
                                  textColor: Color.fromARGB(255, 36, 159, 240),
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Filter",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 36, 159, 240),
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
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
                  Positioned(
                    left: 0,
                    top: 32,
                    child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) => CellTwoItemWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}