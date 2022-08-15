class Expenditure {
  int? id;
  String? type;
  String? desc;
  int? price;
  String? createdAt;

  Expenditure({
    this.id,
    this.type,
    this.price,
    this.desc,
    this.createdAt,
  });

  Expenditure.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'].toString();
    desc = json['desc'].toString();
    price = json['price'];
    createdAt = json['createdAt'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['desc'] = desc;
    data['price'] = price;
    data['createdAt'] = createdAt;
    return data;
  }

  Map<String, dynamic> toJsonForReport() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['price'] = price;
    return data;
  }
}
