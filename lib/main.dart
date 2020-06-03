/*
*  main.dart
*  Edompet
*
*  Created by Ridho Perdana.
*  Copyright © 2018 Anadrep. All rights reserved.
    */

import 'package:flutter/material.dart';

import 'home_widget/home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}
