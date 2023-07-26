
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TodayReportBhangaDataModule extends ChangeNotifier {
  int motorCycle;
  int sedanCar;
  int s4Wheeler;
  int microBus;
  int miniBus;
  int miniTruck;
  int bigBus;
  int mediumTruck;
  int heavyTruck;
  int trailerLong;

  int totalRevenue;
  int totalVehicle;

  int totalYesterdayRevenue;
  int totalYesterdayVehicle;

  int totalAmount;

  TodayReportBhangaDataModule({
    this.motorCycle,
    this.sedanCar,
    this.s4Wheeler,
    this.microBus,
    this.miniBus,
    this.miniTruck,
    this.bigBus,
    this.mediumTruck,
    this.heavyTruck,
    this.trailerLong,
  });

  List<VehicleReportList> vehicleReportList = [];
  List<VehicleReportList> yesterdayVehicleReportList = [];
  List<TodayReportBhangaDataModule> dataList = [];

  fetchData(url) async {
    try {
      var response = await http.get(url);
      var data = json.decode(response.body)['data'] as List;
      dataList.clear();
      dataList.insert(
          0,
          TodayReportBhangaDataModule(

              motorCycle: 0,
              sedanCar: 0,
              s4Wheeler: 0,
              microBus: 0,
              miniBus: 0,
              miniTruck: 0,
              bigBus: 0,
              mediumTruck: 0,
              heavyTruck: 0,
              trailerLong: 0
          ));

      dataList[0].motorCycle =  data[0]['MotorCycle'];
      dataList[0].sedanCar =  data[0]['Sedan_Car'];
      dataList[0].s4Wheeler =  data[0]['4Wheeler'];
      dataList[0].microBus =  data[0]['Micro_Bus'];
      dataList[0].miniBus =  data[0]['Mini_Bus'];
      dataList[0].miniTruck =  data[0]['Mini_Truck'];
      dataList[0].bigBus =  data[0]['Big_Bus'];
      dataList[0].mediumTruck =  data[0]['Medium_Truck'];
      dataList[0].heavyTruck = data[0]['Heavy_Truck'];
      dataList[0].trailerLong =  data[0]['Trailer_Long'];

      totalAmount = data[0]['Total_amount'];


    } catch (e) {

    }
    notifyListeners();
  }

  getYesterdayVehicleData(String url) async {
    try {
      await fetchData(url);
      yesterdayVehicleReportList.clear();

      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Motor Cycle",
          totalVehicle: dataList[0].motorCycle,
          perVehicleRate: 10,
          vehicleImage: "assets/images/motor_cycle2.png"
      ));

      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Sedan Car",
          totalVehicle: dataList[0].sedanCar,
          perVehicleRate: 55,
          vehicleImage: "assets/images/sedan_car.png"
      ));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Four Wheeler",
          totalVehicle: dataList[0].s4Wheeler,
          perVehicleRate: 90,
          vehicleImage: "assets/images/four_wheeler.png"
      ));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Micro Bus",
          totalVehicle: dataList[0].microBus,
          perVehicleRate: 90,
          vehicleImage: "assets/images/micro_bus.png"
      ));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Mini Bus",
          totalVehicle: dataList[0].miniBus,
          perVehicleRate: 110,
          vehicleImage: "assets/images/mini_bus.png"
      ));

      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Mini Truck",
          totalVehicle: dataList[0].miniTruck,
          perVehicleRate: 165,
          vehicleImage: "assets/images/mini_truck.png"
      ));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Large Bus",
          totalVehicle: dataList[0].bigBus,
          perVehicleRate: 200,
          vehicleImage: "assets/images/big_bus.png"
      ));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Medium Truck",
          totalVehicle: dataList[0].mediumTruck,
          perVehicleRate: 320,
          vehicleImage: "assets/images/medium_truck.png"
      ));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Heavy Truck",
          totalVehicle: dataList[0].heavyTruck,
          perVehicleRate: 440,
          vehicleImage: "assets/images/heavy_truck.png"
      ));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Trailer Long",
          totalVehicle: dataList[0].trailerLong,
          perVehicleRate: 675,
          vehicleImage: "assets/images/trailer_long.png"
      ));
      totalYesterdayRevenue = 0;
      totalYesterdayVehicle = 0;
      for (var v in yesterdayVehicleReportList) {
        totalYesterdayRevenue = totalYesterdayRevenue + v.totalVehicle * v.perVehicleRate;
        totalYesterdayVehicle = totalYesterdayVehicle + v.totalVehicle;
      }
    } catch (e) {

    }
    notifyListeners();
  }

  getTodayReportData(String url) async {
    try {
      await fetchData(url);
      vehicleReportList.clear();

      vehicleReportList.add(VehicleReportList(
          vehicleName: "Motor Cycle",
          totalVehicle: dataList[0].motorCycle,
          perVehicleRate: 10,
          vehicleImage: "assets/images/motor_cycle2.png"
      ));

      vehicleReportList.add(VehicleReportList(
          vehicleName: "Sedan Car",
          totalVehicle: dataList[0].sedanCar,
          perVehicleRate: 55,
          vehicleImage: "assets/images/sedan_car.png"
      ));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Four Wheeler",
          totalVehicle: dataList[0].s4Wheeler,
          perVehicleRate: 90,
          vehicleImage: "assets/images/four_wheeler.png"
      ));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Micro Bus",
          totalVehicle: dataList[0].microBus,
          perVehicleRate: 90, //old 60
          vehicleImage: "assets/images/micro_bus.png"
      ));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Mini Bus",
          totalVehicle: dataList[0].miniBus,
          perVehicleRate: 110, //old 75
          vehicleImage: "assets/images/mini_bus.png"
      ));

      vehicleReportList.add(VehicleReportList(
          vehicleName: "Mini Truck",
          totalVehicle: dataList[0].miniTruck,
          perVehicleRate: 165,//old 115
          vehicleImage: "assets/images/mini_truck.png"
      ));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Large Bus",
          totalVehicle: dataList[0].bigBus,
          perVehicleRate: 200,//old 135
          vehicleImage: "assets/images/big_bus.png"
      ));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Medium Truck",
          totalVehicle: dataList[0].mediumTruck,
          perVehicleRate: 220, //old 150
          vehicleImage: "assets/images/medium_truck.png"
      ));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Heavy Truck",
          totalVehicle: dataList[0].heavyTruck,
          perVehicleRate: 440,//old 300
          vehicleImage: "assets/images/heavy_truck.png"
      ));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Trailer Long",
          totalVehicle: dataList[0].trailerLong,
          perVehicleRate: 675,//old 375
          vehicleImage: "assets/images/trailer_long.png"
      ));
      totalRevenue = 0;
      totalVehicle = 0;
      for (var v in vehicleReportList) {
        totalRevenue = totalRevenue + v.totalVehicle * v.perVehicleRate;
        totalVehicle = totalVehicle + v.totalVehicle;
      }
    } catch (e) {

    }
    notifyListeners();
  }

  TodayReportBhangaDataModule.fromJson(Map<String, dynamic> json) {

    motorCycle = int.parse(json['MotorCycle']);
    sedanCar = int.parse(json['Sedan_Car']);
    s4Wheeler = int.parse(json['4Wheeler']);
    microBus = int.parse(json['Micro_Bus']);
    miniBus = int.parse(json['Mini_Bus']);
    miniTruck = int.parse(json['Mini_Truck']);
    bigBus = int.parse(json['Big_Bus']);
    mediumTruck = int.parse(json['Medium_Truck']);
    heavyTruck = int.parse(json['Heavy_Truck']);
    trailerLong = int.parse(json['Trailer_Long']);
  }
}

class VehicleReportList {
  String vehicleName;
  var vehicleImage;
  var totalVehicle;
  var perVehicleRate;

  VehicleReportList({
    this.vehicleName,
    this.vehicleImage,
    this.totalVehicle,
    this.perVehicleRate
  });
}
