import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TodayReportCharsindurDataModule extends ChangeNotifier {
  int rickshawVan;
  int motorCycle;
  int threeFourWheeler;
  int sedanCar;
  int s4Wheeler;
  int microBus;
  int miniBus;
  int agroUse;
  int miniTruck;
  int bigBus;
  int mediumTruck;
  int heavyTruck;
  int trailerLong;

  int totalRevenue;
  int totalVehicle;
  int totalYesterdayRevenue;
  int totalYesterdayVehicle;

  TodayReportCharsindurDataModule({
    this.rickshawVan,
    this.motorCycle,
    this.threeFourWheeler,
    this.sedanCar,
    this.s4Wheeler,
    this.microBus,
    this.miniBus,
    this.agroUse,
    this.miniTruck,
    this.bigBus,
    this.mediumTruck,
    this.heavyTruck,
    this.trailerLong,
  });

  List<VehicleReportList> vehicleReportList = <VehicleReportList>[];
  List<VehicleReportList> yesterdayVehicleReportList = <VehicleReportList>[];
  List<TodayReportCharsindurDataModule> dataList = <TodayReportCharsindurDataModule>[];
  
  fetchData(url) async {
    try{
      var response = await http.get(url);
      var data = json.decode(response.body);
      dataList.clear();
      dataList.insert(
          0,
          TodayReportCharsindurDataModule(
              rickshawVan: 0,
              motorCycle: 0,
              threeFourWheeler: 0,
              sedanCar: 0,
              s4Wheeler: 0,
              microBus: 0,
              miniBus: 0,
              agroUse: 0,
              miniTruck: 0,
              bigBus: 0,
              mediumTruck: 0,
              heavyTruck: 0,
              trailerLong: 0));

      for (var d in data) {
        var value = TodayReportCharsindurDataModule.fromJson(d);
        if (value.rickshawVan == 1) {
          dataList[0].rickshawVan = dataList[0].rickshawVan + 1;
        } else if (value.motorCycle == 1) {
          dataList[0].motorCycle = dataList[0].motorCycle + 1;
        } else if (value.threeFourWheeler == 1) {
          dataList[0].threeFourWheeler = dataList[0].threeFourWheeler + 1;
        } else if (value.sedanCar == 1) {
          dataList[0].sedanCar = dataList[0].sedanCar + 1;
        } else if (value.s4Wheeler == 1) {
          dataList[0].s4Wheeler = dataList[0].s4Wheeler + 1;
        } else if (value.microBus == 1) {
          dataList[0].microBus = dataList[0].microBus + 1;
        } else if (value.miniBus == 1) {
          dataList[0].miniBus = dataList[0].miniBus + 1;
        } else if (value.agroUse == 1) {
          dataList[0].agroUse = dataList[0].agroUse + 1;
        } else if (value.miniTruck == 1) {
          dataList[0].miniTruck = dataList[0].miniTruck + 1;
        } else if (value.bigBus == 1) {
          dataList[0].bigBus = dataList[0].bigBus + 1;
        } else if (value.mediumTruck == 1) {
          dataList[0].mediumTruck = dataList[0].mediumTruck + 1;
        } else if (value.heavyTruck == 1) {
          dataList[0].heavyTruck = dataList[0].heavyTruck + 1;
        } else if (value.trailerLong == 1) {
          dataList[0].trailerLong = dataList[0].trailerLong + 1;
        }
      }
    }catch(e){
      
    }
    notifyListeners();
  }
  
  getYesterdayVehicleData(String url) async {
    try{
      await fetchData(url);
      yesterdayVehicleReportList.clear();
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Rickshaw Van",
          totalVehicle: dataList[0].rickshawVan,
          perVehicleRate: 5,
          vehicleImage: "assets/images/rickshaw_van.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Motor Cycle",
          totalVehicle: dataList[0].motorCycle,
          perVehicleRate: 10,
          vehicleImage: "assets/images/motor_cycle.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "ThreeFour Wheeler",
          totalVehicle: dataList[0].threeFourWheeler,
          perVehicleRate: 20,
          vehicleImage: "assets/images/three_four_wheeler.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Sedan Car",
          totalVehicle: dataList[0].sedanCar,
          perVehicleRate: 40,
          vehicleImage: "assets/images/sedan_car.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Four Wheeler",
          totalVehicle: dataList[0].s4Wheeler,
          perVehicleRate: 60,
          vehicleImage: "assets/images/four_wheeler.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Micro Bus",
          totalVehicle: dataList[0].microBus,
          perVehicleRate: 80,
          vehicleImage: "assets/images/micro_bus.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Mini Bus",
          totalVehicle: dataList[0].miniBus,
          perVehicleRate: 80,
          vehicleImage: "assets/images/mini_bus.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Agro Use",
          totalVehicle: dataList[0].agroUse,
          perVehicleRate: 135,
          vehicleImage: "assets/images/agro_use.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Mini Truck",
          totalVehicle: dataList[0].miniTruck,
          perVehicleRate: 170,
          vehicleImage: "assets/images/mini_truck.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Big Bus",
          totalVehicle: dataList[0].bigBus,
          perVehicleRate: 150,
          vehicleImage: "assets/images/big_bus.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Medium Truck",
          totalVehicle: dataList[0].mediumTruck,
          perVehicleRate: 200,
          vehicleImage: "assets/images/medium_truck.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Heavy Truck",
          totalVehicle: dataList[0].heavyTruck,
          perVehicleRate: 260,
          vehicleImage: "assets/images/heavy_truck.png"));
      yesterdayVehicleReportList.add(VehicleReportList(
          vehicleName: "Trailer Long",
          totalVehicle: dataList[0].trailerLong,
          perVehicleRate: 565,
          vehicleImage: "assets/images/trailer_long.png"));
      totalYesterdayRevenue = 0;
      totalYesterdayVehicle = 0;
      for (var v in yesterdayVehicleReportList) {
        totalYesterdayRevenue = totalYesterdayRevenue + v.totalVehicle * v.perVehicleRate;
        totalYesterdayVehicle = totalYesterdayVehicle + v.totalVehicle;
      }
    }catch(e){
    }
    notifyListeners();
  }

  getTodayReportData(String url) async {
    try {
      await fetchData(url);
      vehicleReportList.clear();
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Rickshaw Van",
          totalVehicle: dataList[0].rickshawVan,
          perVehicleRate: 5,
          vehicleImage: "assets/images/rickshaw_van.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Motor Cycle",
          totalVehicle: dataList[0].motorCycle,
          perVehicleRate: 10,
          vehicleImage: "assets/images/motor_cycle.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "ThreeFour Wheeler",
          totalVehicle: dataList[0].threeFourWheeler,
          perVehicleRate: 20,
          vehicleImage: "assets/images/three_four_wheeler.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Sedan Car",
          totalVehicle: dataList[0].sedanCar,
          perVehicleRate: 40,
          vehicleImage: "assets/images/sedan_car.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Four Wheeler",
          totalVehicle: dataList[0].s4Wheeler,
          perVehicleRate: 60,
          vehicleImage: "assets/images/four_wheeler.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Micro Bus",
          totalVehicle: dataList[0].microBus,
          perVehicleRate: 80,
          vehicleImage: "assets/images/micro_bus.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Mini Bus",
          totalVehicle: dataList[0].miniBus,
          perVehicleRate: 80,
          vehicleImage: "assets/images/mini_bus.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Agro Use",
          totalVehicle: dataList[0].agroUse,
          perVehicleRate: 135,
          vehicleImage: "assets/images/agro_use.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Mini Truck",
          totalVehicle: dataList[0].miniTruck,
          perVehicleRate: 170,
          vehicleImage: "assets/images/mini_truck.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Big Bus",
          totalVehicle: dataList[0].bigBus,
          perVehicleRate: 150,
          vehicleImage: "assets/images/big_bus.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Medium Truck",
          totalVehicle: dataList[0].mediumTruck,
          perVehicleRate: 200,
          vehicleImage: "assets/images/medium_truck.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Heavy Truck",
          totalVehicle: dataList[0].heavyTruck,
          perVehicleRate: 260,
          vehicleImage: "assets/images/heavy_truck.png"));
      vehicleReportList.add(VehicleReportList(
          vehicleName: "Trailer Long",
          totalVehicle: dataList[0].trailerLong,
          perVehicleRate: 565,
          vehicleImage: "assets/images/trailer_long.png"));
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


  TodayReportCharsindurDataModule.fromJson(Map<String, dynamic> json) {
    rickshawVan = int.parse(json['Rickshaw_Van']);
    motorCycle = int.parse(json['MotorCycle']);
    threeFourWheeler = int.parse(json['three_four_Wheeler']);
    sedanCar = int.parse(json['Sedan_Car']);
    s4Wheeler = int.parse(json['4Wheeler']);
    microBus = int.parse(json['Micro_Bus']);
    miniBus = int.parse(json['Mini_Bus']);
    agroUse = int.parse(json['Agro_Use']);
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
