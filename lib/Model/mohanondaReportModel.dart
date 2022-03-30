class MohanondaReportModel {
  List<Data> data;

  MohanondaReportModel({this.data});

  MohanondaReportModel.fromJson(Map<String, dynamic> json) {
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
  String rickshawVan;
  String motorCycle;
  String threeFourWheeler;
  String sedanCar;
  String s4Wheeler;
  String microBus;
  String miniBus;
  String agroUse;
  String miniTruck;
  String bigBus;
  String mediumTruck;
  String heavyTruck;
  String trailerLong;

  Data({
    this.rickshawVan,
    this.motorCycle,
    this.threeFourWheeler,
    this.sedanCar,
    this.s4Wheeler,
    this.miniBus,
    this.agroUse,
    this.miniTruck,
    this.bigBus,
    this.mediumTruck,
    this.heavyTruck,
    this.trailerLong
  });

  Data.fromJson(Map<String, dynamic> json) {
    rickshawVan = json['Rickshaw_Van'];
    motorCycle = json['MotorCycle'];
    threeFourWheeler = json['three_four_Wheeler'];
    sedanCar = json['Sedan_Car'];
    s4Wheeler = json['4Wheeler'];
    microBus = json['Micro_Bus'];
    miniBus = json['Mini_Bus'];
    agroUse = json['Agro_Use'];
    miniTruck = json['Mini_Truck'];
    bigBus = json['Big_Bus'];
    mediumTruck = json['Medium_Truck'];
    heavyTruck = json['Heavy_Truck'];
    trailerLong = json['Trailer_Long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Rickshaw_Van'] = this.rickshawVan;
    data['MotorCycle'] = this.motorCycle;
    data['three_four_Wheeler'] = this.threeFourWheeler;
    data['Sedan_Car'] = this.sedanCar;
    data['4Wheeler'] = this.s4Wheeler;
    data['Micro_Bus'] = this.microBus;
    data['Mini_Bus'] = this.miniBus;
    data['Agro_Use'] = this.agroUse;
    data['Mini_Truck'] = this.miniTruck;
    data['Big_Bus'] = this.bigBus;
    data['Medium_Truck'] = this.mediumTruck;
    data['Heavy_Truck'] = this.heavyTruck;
    data['Trailer_Long'] = this.trailerLong;
    return data;
  }
}
