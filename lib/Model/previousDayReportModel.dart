class PreviousDayModel {
  List<Data> data;

  PreviousDayModel({this.data});

  PreviousDayModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    if(data.length > 7) {
      data.remove(data.last);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
  }
}

class Data {
  String date;
  int totalVehicles;
  int amount;

  Data({this.date, this.totalVehicles, this.amount});

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
