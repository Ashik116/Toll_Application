class WinVehicleReportModule {
  String vehicleName;
  String regular;
  String notOverload;
  String ctrlR;
  String image;

  WinVehicleReportModule({
    this.vehicleName,
    this.regular,
    this.notOverload,
    this.ctrlR,
    this.image
  });
}

class ShortReportModel {
  String ctrlR;
  String regular;
  String total;
  String notOverload;
  String date;
  ShortReportModel({
    this.ctrlR,
    this.regular,
    this.total,
    this.notOverload,
    this.date
  });

  ShortReportModel.fromJson(Map<dynamic, dynamic> json) {
    ctrlR = json['ctrlR'];
    regular = json['regular'];
    total = json['total'];
    notOverload = json['overld'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['ctrlR'] = this.ctrlR;
    data['regular'] = this.regular;
    data['total'] = this.total;
    return data;
  }
}

class CtrlReportModel {
  String ctrl2;
  String ctrl3;
  String ctrl4;
  String ctrl5;
  String ctrl6;
  String ctrl7;

  CtrlReportModel({
    this.ctrl2,
    this.ctrl3,
    this.ctrl4,
    this.ctrl5,
    this.ctrl6,
    this.ctrl7
  });

  CtrlReportModel.fromJson(Map<dynamic, dynamic> json2) {
    ctrl2 = json2['ctrl_axel2'];
    ctrl3 = json2['ctrl_axel3'];
    ctrl4 = json2['ctrl_axel4'];
    ctrl5 = json2['ctrl_axel5'];
    ctrl6 = json2['ctrl_axel6'];
    ctrl7 = json2['ctrl_axel7'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['ctrl_axel2'] = this.ctrl2;
    data['ctrl_axel3'] = this.ctrl3;
    data['ctrl_axel4'] = this.ctrl4;
    data['ctrl_axel5'] = this.ctrl5;
    data['ctrl_axel6'] = this.ctrl6;
    data['ctrl_axel7'] = this.ctrl7;

    return data;
  }
}