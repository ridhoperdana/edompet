import 'package:edompet/models/transaction.dart';
import 'package:edompet/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_wallet/add_wallet.dart';
import 'add_income/add_income.dart';
import 'add_expense/add_expense.dart';
import 'dashboard/dashboard.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  int currentIndex = 0;
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  int _prevState = 0;
  List<Widget> _children;

  onTabTapped(int index) {
    setState(() {
      _prevState = _currentIndex;
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _children = [
      Dashboard(),
      AddExpense(_currentIndex),
      AddIncome(_currentIndex),
      AddWallet()
    ];
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _children = [
      Dashboard(),
      AddExpense(_prevState),
      AddIncome(_prevState),
      AddWallet()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eDompet',
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          '/transactions': (context) => Transactions(settings.arguments),
          '/': (context) => Dashboard(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped,
            currentIndex: _currentIndex, // new
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'asset/images/home.svg',
                  color: Colors.grey[700],
                  height: 25,
                ),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'asset/images/expense.svg',
                  color: Colors.grey[700],
                  height: 25,
                ),
                title: Text('Expense'),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'asset/images/income.svg',
                  color: Colors.grey[700],
                  height: 25,
                ),
                title: Text('Income'),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'asset/images/wallet.svg',
                  color: Colors.grey[700],
                  height: 25,
                ),
                title: Text('Wallets'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
