import 'package:edompet/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:edompet/repository/db.dart';
import 'package:edompet/models/wallet.dart';
import 'package:csv/csv.dart';

class Service {
  Operation dbHelper = Operation();

  void updateCurrentWallet(String walletID) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setInt('wallet_id', int.parse(walletID));
    } catch (e) {
      print('Error update wallet $e');
    }
  }

  Future<DataDashboard> getData() async {
    DataDashboard data;
    try {
      var walletID = 1;
      var prefs = await SharedPreferences.getInstance();
      if (prefs.get('wallet_id') != null) {
        walletID = prefs.get('wallet_id');
      }

      var wallet = await dbHelper.getWallet(walletID);

      return DataDashboard(wallet);
    } catch (e) {
      print('error getting dashboard data: $e');
    }
    return data;
  }

  Future<int> getWalletID() async {
    int walletID = 1;
    try {
      var prefs = await SharedPreferences.getInstance();
      if (prefs.get('wallet_id') != null) {
        walletID = prefs.get('wallet_id');
      }
    } catch (e) {
      print('error getting dashboard data: $e');
    }
    return walletID;
  }

  Future<bool> deleteTransaction(int id) async {
    try {
      var deletedID = await dbHelper.deleteTransaction(id);
      if (deletedID > 0) {
        return true;
      }
    } catch (e) {
      print('Failed to delete transaction');
    }

    return false;
  }

  Future<bool> deleteWallet(int id) async {
    try {
      var deletedID = await dbHelper.deleteWallet(id);
      if (deletedID > 0) {
        return true;
      }
    } catch (e) {
      print('Failed to delete wallet');
    }

    return false;
  }

  Future<bool> updateTransaction(Transaction transaction) async {
    try {
      var result = await dbHelper.updateTransaction(transaction);
      if (result != null) {
        return true;
      }
    } catch (e) {
      print('Failed to update transaction');
    }

    return false;
  }

  Future<Transaction> insertTransaction(Transaction transaction) async {
    Transaction emptyTransaction;
    try {
      var result = await dbHelper.insertTransaction(transaction);
      if (result != null) {
        transaction.id = result.toString();
        return transaction;
      }
    } catch (e) {
      print('Failed to insert transaction');
    }

    return emptyTransaction;
  }

  Future<String> generateCSV() async {
    var wallets = await dbHelper.fetchWalletWithTransactions();
    var converter = const ListToCsvConverter();
    var data = <List>[];
    var keys = <String>[];
    var keyIndexMap = <String, int>{};

    // Add the key and fix previous records
    int _addKey(String key) {
      var index = keys.length;
      keyIndexMap[key] = index;
      keys.add(key);
      for (var dataRow in data) {
        dataRow.add(null);
      }
      return index;
    }

    for (var wallet in wallets) {
      // This list might grow if a new key is found
      var dataRow = List(keyIndexMap.length);
      // Fix missing key
      var keyIndex = keyIndexMap['id'];
      if (keyIndex == null) {
        // New key is found
        // Add it and fix previous data
        keyIndex = _addKey('id');
        // grow our list
        dataRow = List.from(dataRow, growable: true)..add(wallet.id);
      } else {
        dataRow[keyIndex] = wallet.id;
      }

      keyIndex = keyIndexMap['name'];
      if (keyIndex == null) {
        keyIndex = _addKey('name');
        dataRow = List.from(dataRow, growable: true)..add(wallet.name);
      } else {
        dataRow[keyIndex] = wallet.name;
      }

      keyIndex = keyIndexMap['color'];
      if (keyIndex == null) {
        keyIndex = _addKey('color');
        dataRow = List.from(dataRow, growable: true)..add(wallet.color);
      } else {
        dataRow[keyIndex] = wallet.color;
      }

      keyIndex = keyIndexMap['transactions'];
      if (keyIndex == null) {
        keyIndex = _addKey('transactions');
        dataRow = List.from(dataRow, growable: true)..add(wallet.transactions);
      } else {
        dataRow[keyIndex] = wallet.transactions;
      }

      data.add(dataRow);
    }

    return converter.convert(<List>[]
      ..add(keys)
      ..addAll(data));
  }
}
