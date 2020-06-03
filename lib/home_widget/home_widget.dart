/*
*  home_widget.dart
*  Edompet
*
*  Created by Ridho Perdana.
*  Copyright © 2018 Anadrep. All rights reserved.
    */

import 'package:edompet/values/values.dart';
import 'package:flutter/material.dart';


class HomeWidget extends StatelessWidget {
  
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
              alignment: Alignment.topCenter,
              child: Container(
                width: 317,
                height: 43,
                margin: EdgeInsets.only(top: 17),
                child: Row(
                  children: [
                    Text(
                      "Dashboard",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        "assets/images/export.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 278,
                height: 125,
                margin: EdgeInsets.only(left: 33, top: 39),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Your current money..",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 23,
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 63,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 64, 152, 100),
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
                                  color: AppColors.primaryText,
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
                      child: Stack(
                        children: [
                          Positioned(
                            top: -5,
                            right: 0,
                            child: Text(
                              "10.500.000",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
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
                                color: AppColors.primaryText,
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
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 306,
                height: 446,
                margin: EdgeInsets.only(left: 19, top: 36),
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
                      width: 228,
                      height: 38,
                      margin: EdgeInsets.only(left: 17, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 13),
                            child: Text(
                              "Last 3 Transactions",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                              ),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 63,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 64, 152, 100),
                              ),
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 266,
                      height: 87,
                      margin: EdgeInsets.only(left: 17, top: 20),
                      decoration: BoxDecoration(
                        color: AppColors.ternaryBackground,
                        borderRadius: Radii.k8pxRadius,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            top: 8,
                            right: 79,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Tagihan kartu kredit",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 1, top: 13),
                                    child: Text(
                                      "360.000",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.secondaryText,
                                        fontFamily: "Helvetica",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 29,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 29,
                            child: Text(
                              "4 April 2020",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 266,
                      height: 87,
                      margin: EdgeInsets.only(left: 17, top: 20),
                      decoration: BoxDecoration(
                        color: AppColors.ternaryBackground,
                        borderRadius: Radii.k8pxRadius,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            top: 8,
                            right: 143,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "bayar netflix",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 1, top: 13),
                                    child: Text(
                                      "169.000",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.secondaryText,
                                        fontFamily: "Helvetica",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 29,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 29,
                            child: Text(
                              "6 April 2020",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 266,
                      height: 87,
                      margin: EdgeInsets.only(left: 17, bottom: 14),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 65, 152, 100),
                        borderRadius: Radii.k8pxRadius,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 8, right: 134),
                            child: Text(
                              "gaji freelance",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 17, right: 119),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 15,
                                  right: 0,
                                  child: Text(
                                    "7.500.000",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.secondaryText,
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 29,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 38,
                                  child: Text(
                                    "4 April 2020",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.secondaryText,
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 261,
                        height: 33,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 228, 228, 228),
                          boxShadow: [
                            Shadows.secondaryShadow,
                          ],
                          borderRadius: Radii.k8pxRadius,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 94),
                              child: Text(
                                "Load More",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
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
            ),
            Spacer(),
            Container(
              height: 75,
              margin: EdgeInsets.only(left: 13, right: 14, bottom: 13),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: Radii.k8pxRadius,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 37,
                    right: 45,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 41,
                            height: 46,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 30,
                                  margin: EdgeInsets.symmetric(horizontal: 7),
                                  child: Image.asset(
                                    "assets/images/bill.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  child: Text(
                                    "Expense",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 28,
                            height: 46,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 28,
                                  child: Image.asset(
                                    "assets/images/money.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Wallet",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 34,
                          child: Image.asset(
                            "assets/images/coin.png",
                            fit: BoxFit.none,
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(left: 1, right: 2),
                          child: Text(
                            "Saving",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
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
    );
  }
}