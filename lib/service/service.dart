import 'package:shared_preferences/shared_preferences.dart';
import 'package:edompet/repository/db.dart';
import 'package:edompet/models/wallet.dart';

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
}
