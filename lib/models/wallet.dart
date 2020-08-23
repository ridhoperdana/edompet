import 'package:edompet/models/transaction.dart';

class Wallet {
  String name;
  int initialMoney;
  String color;
  String id = '0';
  List<Transaction> transactions;

  Wallet(this.name, this.initialMoney, this.color);

  Wallet.fromMap(Map<String, dynamic> map) {
    this.id = map["id"].toString();
    this.color = map["color"];
    this.name = map["name"];
  }

  set setName(String value) => name;
  set setInitialMoney(int value) => initialMoney;
  set setColor(String value) => color;
  set setId(String value) => id;
  set setTransactions(List<Transaction> transactions) => transactions;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = this.id;
    map["name"] = this.name;
    map["initial_money"] = this.initialMoney;
    map["color"] = this.color;
    if (this.transactions.length > 0) {
      map["transactions"] = this.transactions;
    }

    return map;
  }
}

class DataDashboard {
  Wallet _wallet;
  DataDashboard(this._wallet);

  Wallet get getWallet {
    return this._wallet;
  }
}
