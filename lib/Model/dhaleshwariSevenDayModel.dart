class SevenDaysDataModelDhaleshwari {
  List<Data> data;

  SevenDaysDataModelDhaleshwari({this.data});

  SevenDaysDataModelDhaleshwari.fromJson(Map<String, dynamic> json) {
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
  int total_amount;
  int motorcycle;
  int sedancar;
  int four_wheeler;
  int microbus;
  int minibus;
  int minitruck;
  int bigbus;
  int medium_truck;
  int heavy_truck;
  int trailer_long;

  Data({
    this.date,
    this.total_amount,
    this.motorcycle,
    this.sedancar,
    this.four_wheeler,
    this.microbus,
    this.minibus,
    this.minitruck,
    this.bigbus,
    this.medium_truck,
    this.heavy_truck,
    this.trailer_long
  });

  Data.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    total_amount = json['Total_amount'];
    motorcycle = json['MotorCycle'];
    sedancar = json['Sedan_Car'];
    four_wheeler = json['4Wheeler'];
    microbus = json['Micro_Bus'];
    minibus = json['Mini_Bus'];
    minitruck = json['Mini_Truck'];
    bigbus = json['Big_Bus'];
    medium_truck = json['Medium_Truck'];
    heavy_truck = json['Heavy_Truck'];
    trailer_long = json['Trailer_Long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Date'] = this.date;
    data['Total_amount'] = this.total_amount;

    data['MotorCycle'] = this.motorcycle;

    data['Sedan_Car'] = this.sedancar;
    data['4Wheeler'] = this.four_wheeler;
    data['Micro_Bus'] = this.microbus;
    data['Mini_Bus'] = this.minibus;

    data['Mini_Truck'] = this.minitruck;
    data['Big_Bus'] = this.bigbus;
    data['Medium_Truck'] = this.medium_truck;
    data['Heavy_Truck'] = this.heavy_truck;
    data['Trailer_Long'] = this.trailer_long;
    return data;
  }
}