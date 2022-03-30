class WinVehicleReportModule{
  String vehicleName;
  String regular;
  String ctrlR;
  String image;

  WinVehicleReportModule({
    this.vehicleName,
    this.regular,
    this.ctrlR,
    this.image
  });
}

class ShortReportModel{
  String ctrlR;
  String regular;
  String total;
  String date;

  ShortReportModel({
    this.ctrlR,
    this.regular,
    this.total,
    this.date
  });

  ShortReportModel.fromJson(Map<dynamic, dynamic> json) {
    ctrlR = json['ctrlR'];
    regular = json['regular'];
    total = json['total'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['ctrlR'] = this.ctrlR;
    data['regular'] = this.regular;
    data['total'] = this.total;
    return data;
  }
}


