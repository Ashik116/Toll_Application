class SearchModel {
  List<Data> data;

  SearchModel({this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
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
  String amount;
  String rickshawVan;
  String lan;
  String imagase;
  String dateTime;
  String userName;

  Data({
    this.amount,
    this.rickshawVan,
    this.lan,
    this.imagase,
    this.dateTime,
    this.userName
  });

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    rickshawVan = json['Rickshaw_Van'];
    lan = json['lan'];
    imagase = json['imagase'];
    dateTime = json['date_time'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['Rickshaw_Van'] = this.rickshawVan;
    data['lan'] = this.lan;
    data['imagase'] = this.imagase;
    data['date_time'] = this.dateTime;
    data['user_name'] = this.userName;
    return data;
  }
}
