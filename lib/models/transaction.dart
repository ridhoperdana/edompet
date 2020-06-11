class Transaction {
  String shortDescription = '';
  String category = '';
  String type = '';
  int moneySpent = 0;
  DateTime dateTime;

  Transaction(this.type);

  save() {
    print('saving transaction');
  }
}
