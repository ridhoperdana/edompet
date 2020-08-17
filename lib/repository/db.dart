import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:edompet/models/transaction.dart' as trans;
import 'package:edompet/models/wallet.dart';

class SqlLite {
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/edompet.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    try {
      await db.execute('''
      CREATE TABLE wallet (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        color TEXT
      );
    ''');

      await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        short_description TEXT,
        category TEXT,
        type TEXT,
        spent_value INTEGER,
        created_time TEXT,
        wallet_id INTEGER
      );
    ''');
    } catch (e) {
      print('Error create db : $e');
    }
  }
}

class Operation {
  static const transactionTable = 'transactions';

  SqlLite dbHelper = new SqlLite();
  Future<int> insertTransaction(trans.Transaction transaction) async {
    Database db = await dbHelper.initDb();
    final sql = '''INSERT INTO ${Operation.transactionTable}
    (
      short_description,
      category,
      type,
      spent_value,
      created_time,
      wallet_id
    )
    VALUES (?,?,?,?,?,?)''';
    List<dynamic> params = [
      transaction.shortDescription,
      transaction.category,
      transaction.type,
      transaction.moneySpent,
      transaction.dateTime.toIso8601String(),
      transaction.walletID
    ];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  // Future<int> updateTransaction(trans.Transaction transaction) async {
  //   Database db = await dbHelper.initDb();
  //   final sql = '''UPDATE ${Operation.transactionTable}
  //   SET ${CRUD.name} = ?, ${CRUD.phone}
  //   WHERE ${CRUD.id} = ?
  //   ''';
  //   List<dynamic> params = [todo.name, todo.phone, todo.id];
  //   final result = await db.rawUpdate(sql, params);
  //   return result;
  // }

  // Future<int> delete(ClassPenangkap todo) async {
  //   Database db = await dbHelper.initDb();
  //   final sql = '''DELETE FROM ${CRUD.todoTable}
  //   WHERE ${CRUD.id} = ?
  //   ''';
  //   List<dynamic> params = [todo.id];
  //   final result = await db.rawDelete(sql, params);
  //   return result;
  // }

  Future<List<trans.Transaction>> fetchTransactions(
      String transactionType, int walletID) async {
    Database db = await dbHelper.initDb();
    var sql = '';
    switch (transactionType) {
      case 'all':
        sql =
            '''SELECT * FROM ${Operation.transactionTable} WHERE wallet_id = $walletID
            ORDER BY datetime(created_time) DESC''';
        break;
      default:
        sql = '''SELECT * FROM ${Operation.transactionTable} 
            WHERE type = "$transactionType" AND wallet_id = $walletID
            ORDER BY datetime(created_time) DESC''';
    }

    final data = await db.rawQuery(sql);

    List<trans.Transaction> transactions = List();
    for (final node in data) {
      final trans.Transaction transaction = trans.Transaction.fromMap(node);
      transactions.add(transaction);
    }

    return transactions;
  }

  Future<int> countTotalIncome(int walletID) async {
    Database db = await dbHelper.initDb();
    final sql =
        '''SELECT SUM(spent_value) AS total FROM ${Operation.transactionTable} WHERE type = "income" AND wallet_id = $walletID''';

    var result = 0;
    try {
      final data = await db.rawQuery(sql);

      for (final node in data) {
        if (node['total'] != null) {
          result += node['total'];
        }
      }
    } catch (e) {
      print('Error count income $e');
    }

    return result;
  }

  Future<int> countTotalExpense(int walletID) async {
    Database db = await dbHelper.initDb();
    final sql =
        '''SELECT SUM(spent_value) AS total FROM ${Operation.transactionTable} 
        WHERE type = "expense" AND wallet_id = $walletID''';

    var result = 0;
    try {
      final data = await db.rawQuery(sql);

      for (final node in data) {
        if (node['total'] != null) {
          result += node['total'];
        }
      }
    } catch (e) {
      print('Error count expense $e');
    }

    return result;
  }

  Future<Wallet> getWallet(int walletID) async {
    Database db = await dbHelper.initDb();
    final sql = '''SELECT id, name, color FROM wallet WHERE id = $walletID''';

    Wallet wallet;
    try {
      final data = await db.rawQuery(sql);

      for (final node in data) {
        if (node != null) {
          wallet = Wallet.fromMap(node);
          var income = await countTotalIncome(walletID);
          var expense = await countTotalExpense(walletID);
          wallet.initialMoney = income - expense;
        }
      }
    } catch (e) {
      print('Error get wallet $e');
    }

    return wallet;
  }

  Future<List<Wallet>> fetchWallet() async {
    Database db = await dbHelper.initDb();
    var sql = '''SELECT id, name, color FROM wallet''';
    List<Wallet> wallets = List();
    try {
      final data = await db.rawQuery(sql);
      for (final node in data) {
        final Wallet wallet = Wallet.fromMap(node);
        var walletID = int.parse(wallet.id);
        var income = await countTotalIncome(walletID);
        var expense = await countTotalExpense(walletID);
        wallet.initialMoney = income - expense;
        wallets.add(wallet);
      }
    } catch (e) {
      print('error fetch wallet: $e');
    }

    return wallets;
  }
}
