/*
*  wallets_widget.dart
*  Edompet
*
*  Created by Ridho Perdana.
*  Copyright © 2018 Anadrep. All rights reserved.
    */

import 'package:edompet/values/values.dart';
import 'package:flutter/material.dart';


class WalletsWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                        "assets/images/left-arrow-5.png",
                        fit: BoxFit.none,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Wallets",
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
            Container(
              width: 334,
              height: 109,
              margin: EdgeInsets.only(top: 39, right: 20),
              decoration: BoxDecoration(
                color: AppColors.secondaryBackground,
                borderRadius: Radii.k8pxRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 159,
                    height: 55,
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Uang bulanan",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 1),
                            child: Text(
                              "Rp. 5.000.000",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w300,
                                fontSize: 22,
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
            Container(
              width: 334,
              height: 109,
              margin: EdgeInsets.only(top: 27, right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 119, 40),
                borderRadius: Radii.k8pxRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 231,
                    height: 55,
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Tabungan beli game",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 1),
                            child: Text(
                              "Rp. 650.000",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.w300,
                                fontSize: 22,
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
            Container(
              width: 107,
              height: 55,
              margin: EdgeInsets.only(top: 22, right: 16),
              decoration: BoxDecoration(
                color: AppColors.secondaryElement,
                boxShadow: [
                  Shadows.primaryShadow,
                ],
                borderRadius: Radii.k8pxRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Add More",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
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