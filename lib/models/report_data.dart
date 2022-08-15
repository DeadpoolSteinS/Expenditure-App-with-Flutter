class ReportData {
  String type;
  int price;

  ReportData({
    required this.type,
    required this.price,
  });

  void addPrice(int newPrice) {
    price += newPrice;
  }

  String getType() {
    return type;
  }

  int getPrice() {
    return price;
  }
}
