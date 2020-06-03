/*
*  all_savings_widget.dart
*  Edompet
*
*  Created by Ridho Perdana.
*  Copyright © 2018 Anadrep. All rights reserved.
    */

import 'package:edompet/values/values.dart';
import 'package:flutter/material.dart';


class AllSavingsWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 324,
                height: 43,
                margin: EdgeInsets.only(left: 21, top: 17),
                child: Row(
                  children: [
                    Container(
                      width: 23,
                      height: 19,
                      child: Image.asset(
                        "assets/images/left-arrow-2.png",
                        fit: BoxFit.none,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 19),
                      child: Text(
                        "All Savings",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                        ),
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
            Container(
              width: 333,
              height: 372,
              margin: EdgeInsets.only(top: 32),
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
                      ],
                    ),
                  ),
                  Container(
                    height: 82,
                    margin: EdgeInsets.only(top: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Tagihan kartu kredit",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "30 May 2020",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.accentText,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Rp. 120.000",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w300,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
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
          ],
        ),
      ),
    );
  }
}