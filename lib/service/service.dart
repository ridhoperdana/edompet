import 'package:shared_preferences/shared_preferences.dart';
import 'package:edompet/repository/db.dart';
import 'package:edompet/models/wallet.dart';

class Service {
  Operation dbHelper = Operation();

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
}
