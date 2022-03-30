class VipPreviousReport {
  List<Data> data;

  VipPreviousReport({this.data});

  VipPreviousReport.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String date;
  int totalVehicles;
  int amount;

  Data({
    this.date,
    this.totalVehicles,
    this.amount
  });

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    totalVehicles = json['Total_vehicles'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['Total_vehicles'] = this.totalVehicles;
    data['amount'] = this.amount;
    return data;
  }
}
