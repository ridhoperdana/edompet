class Transaction {
  String shortDescription = '';
  String category = '';
  String type = '';
  int moneySpent = 0;
  DateTime dateTime;
  String id;

  Transaction(this.type);

  Transaction.fromMap(Map<String, dynamic> map) {
    this.shortDescription = map["short_desription"];
    this.category = map["category"];
    this.type = map["type"];
    this.moneySpent = map["spent_value"];
    this.dateTime = map["created_time"];
    this.id = map["id"];
  }

  set setShortDescription(String value) => shortDescription;
  set setCategory(String category) => category;
  set setType(String value) => type;
  set setMoneySpent(int value) => moneySpent;
  set setCreatedTime(DateTime value) => dateTime;
  set setId(String value) => id;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = this.id;
    map["short_description"] = this.shortDescription;
    map["category"] = this.category;
    map["type"] = this.type;
    map["spent_value"] = this.moneySpent;
    map["created_time"] = this.dateTime;

    return map;
  }
}
