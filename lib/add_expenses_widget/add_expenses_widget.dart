/*
*  add_expenses_widget.dart
*  Edompet
*
*  Created by Ridho Perdana.
*  Copyright © 2018 Anadrep. All rights reserved.
    */

import 'package:edompet/values/values.dart';
import 'package:flutter/material.dart';


class AddExpensesWidget extends StatelessWidget {
  
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
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 167,
                height: 43,
                margin: EdgeInsets.only(left: 21, top: 17),
                child: Row(
                  children: [
                    Container(
                      width: 23,
                      height: 19,
                      child: Image.asset(
                        "assets/images/left-arrow-3.png",
                        fit: BoxFit.none,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Add Expense",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 334,
                height: 109,
                margin: EdgeInsets.only(top: 39, right: 20),
                decoration: BoxDecoration(
                  color: AppColors.ternaryBackground,
                  borderRadius: Radii.k8pxRadius,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Tagihan kartu kredit",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 1, top: 21),
                              child: Text(
                                "360.000",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 33,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 21,
                      top: 38,
                      child: Text(
                        "4 April 2020",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w300,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 333,
                height: 175,
                margin: EdgeInsets.only(top: 27, right: 20),
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  boxShadow: [
                    Shadows.primaryShadow,
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 284,
                      height: 36,
                      margin: EdgeInsets.only(left: 21, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Money spent",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 1),
                              child: Text(
                                "Rp. 120.000",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                            ),
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 284,
                      height: 36,
                      margin: EdgeInsets.only(left: 21, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Date",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 1),
                              child: Text(
                                "30 May 2020",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                            ),
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 284,
                      height: 36,
                      margin: EdgeInsets.only(left: 21, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Short Description",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.accentText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 1),
                              child: Text(
                                "Beli laptop stand",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                            ),
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.only(left: 128, top: 22, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 107,
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.accentElement,
                        borderRadius: Radii.k8pxRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Cancel",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 107,
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryElement,
                        borderRadius: Radii.k8pxRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Save",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
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
    );
  }
}