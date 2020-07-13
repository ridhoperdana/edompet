class Wallet {
  String name;
  int initialMoney;
  String color;
  String id;

  Wallet(this.name, this.initialMoney, this.color);

  Wallet.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.initialMoney = map["initial_money"];
    this.color = map["color"];
    this.name = map["name"];
  }

  set setName(String value) => name;
  set setInitialMoney(int value) => initialMoney;
  set setColor(String value) => color;
  set setId(String value) => id;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = this.id;
    map["name"] = this.name;
    map["initial_money"] = this.initialMoney;
    map["color"] = this.color;

    return map;
  }
}
